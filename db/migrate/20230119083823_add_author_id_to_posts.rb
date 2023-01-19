class AddAuthorIdToPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :users, null: false, foreign_key: true
  end
end
