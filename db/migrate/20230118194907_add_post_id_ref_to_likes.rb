class AddPostIdRefToLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :like, null: false, foreign_key: true
  end
end
