class AddForeignKeys < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :author, index: true, foreign_key:{to_table: :users}
    add_reference :comments, :post, index: true, foreign_key:true

    add_reference :likes, :author, index: true, foreign_key:{to_table: :users}
    add_reference :likes, :post, index: true, foreign_key: true

    add_reference :posts, :author, index: true, foreign_key: {to_table: :users}
  end
end
