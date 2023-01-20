class AddPostIdToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :post_id, :integer
  end
end
