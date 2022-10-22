class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes

  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :name, presence: true
  
  def three_recent_posts_per_user
    posts.last(3)
  end
end