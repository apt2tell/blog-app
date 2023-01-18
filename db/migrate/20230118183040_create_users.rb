class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.text :bio
      t.string :photo
      t.datetime :updated_at
      t.datetime :created_at
      t.integer :postCounter

      t.timestamps
    end
  end
end
