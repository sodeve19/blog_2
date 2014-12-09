class CommentsController < ApplicationController
  
  http_basic_authenticate_with name: "sodeve", password: "123456", only: :destroy

  def create
    @article = Article.find(params[:article_id])
    #@comment = @article.comments.create(comment_params)
    @comment = @article.comments.build(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to article_path(@article, anchor: "comment_#{@comment.id}")
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end
 
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
