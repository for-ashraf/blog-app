class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  after_save :update_comment_counter

  private

  def update_comment_counter
    post.update(comments_counter(:post.comments.length))
  end
end
