class RenamePostsIdInLikes < ActiveRecord::Migration[7.0]
  def change
    rename_column :likes, :posts_id, :post_id
  end
end
