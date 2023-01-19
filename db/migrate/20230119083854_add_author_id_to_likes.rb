class AddAuthorIdToLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :users, null: false, foreign_key: true
  end
end
