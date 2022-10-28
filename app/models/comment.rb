class Comment < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :post, counter_cache: :comments_counter
end
