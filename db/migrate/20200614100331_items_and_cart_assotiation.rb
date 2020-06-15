class ItemsAndCartAssotiation < ActiveRecord::Migration[6.0]
  def change
    create_table :carts_items, id: false do |t|
      t.integer :item_id
      t.integer :cart_id
    end
  end
end
