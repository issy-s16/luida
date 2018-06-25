class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string "title", null: false
      t.string "description", null: false
      t.string "repository_url", null: false
      t.string "author", null: false
      t.timestamps
    end
  end
end
