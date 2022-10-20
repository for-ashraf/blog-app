class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :like

  after_save :update_post_counter
  
  def five_most_recent_comments
    Comment.where(PostID:self).order(created_at: :desc).limit(5)
  end

  private

  def update_post_counter
    author.increment!(:postCounter)
  end

end
