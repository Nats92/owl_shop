class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.float  :price
      t.string :description
      t.string :image
      t.timestamps
    end
    add_index :items, :price
    add_index :items, :name
  end
end
