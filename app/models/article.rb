class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 4 }

  def self.commentsCount 
    Comment.select("article_id, count(*) comments_number")
           .joins(:article)
           .group(:article_id)
           .order("comments_number DESC")
           .limit(5)#("as numberofcomments").order("numberofcomments DESC")
  end

end
