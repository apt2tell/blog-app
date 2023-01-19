class RenameUserIdInPosts < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :users_id, :author_id
  end
end
