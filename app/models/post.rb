class Post < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  has_many :comments, foreign_key: 'post_id'
  has_many :like, foreign_key: 'post_id'

  after_save :update_post_counter

  def five_most_recent_comments
    Comment.where(PostID: self).order(created_at: :desc).limit(5)
  end

  private

  def update_post_counter
    author.increment!(:postCounter)
  end
end
