class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :like

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :update_post_counter

  def five_most_recent_comments
    Comment.where(PostID: self).order(created_at: :desc).limit(5)
  end

  private

  def update_post_counter
    author.increment!(:postCounter)
  end
end
