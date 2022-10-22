class Like < ApplicationRecord
  after_save :update_likes_counter
  belongs_to :post
  belongs_to :author

  private

  def update_likes_counter
    post.update(likes_counter(:post.likes.length))
  end
end