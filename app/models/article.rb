class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 4 }

  def self.commentsCount 
    Comment.select("article_id, count(*) as commentsNumber")
           .joins(:article)
           .group(:article_id)
           .order("commentsNumber DESC")
           .limit(5)#("as numberofcomments").order("numberofcomments DESC")
  end

end
