class RenameUserIdInComments < ActiveRecord::Migration[7.0]
  def change
    rename_column :comments, :users_id, :author_id
  end
end
