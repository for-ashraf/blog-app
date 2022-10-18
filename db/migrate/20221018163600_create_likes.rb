# frozen_string_literal: true

class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes, &:timestamps
    add_reference :likes, :users, null: false, foreign_key: true
    add_reference :likes, :posts, null: false, foreign_key: true
  end
end
