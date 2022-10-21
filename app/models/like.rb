class Like < ApplicationRecord
  belongs_to :users, foreign_key: 'user_id'
  belongs_to :posts, foreign_key: 'post_id'

  after_save :update_likes_counter

  def update_likes_counter
    post.increment!(:likesCounter)
  end

  private :update_likes_counter
end
