class AddAttributesToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :name, :string
    add_column :products, :sku, :string
    add_column :products, :price, :float
    add_column :products, :weight, :float
    add_column :products, :min_order_quantity, :string
    add_column :products, :origin, :string
    add_column :products, :packaging, :string

  end
end
