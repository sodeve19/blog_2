class ArticlesController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  # http_basic_authenticate_with name: "sodeve", password: "123456", except: [:index, :show]


  def new
    if current_user.writter
      @article = current_user.articles.new
#    render :new
    else 
      redirect_to articles_path
    end
#    @article = current_user.articles.new
#    render :new

  end

  def create
    @article = current_user.articles.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
   
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def index
    @articles = Article.all.order("created_at DESC") 
    @top_articles = Article.all.order("created_at DESC").limit(5) 
  end

  def destroy
    @article = current_user.article.find(params[:id])
    @article.destroy
   
    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end

end

