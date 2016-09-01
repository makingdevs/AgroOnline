class AddNewAttributesInProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :cultivation_type, :string
    add_column :products, :style, :string
    add_column :products, :color, :string
    add_column :products, :shelf_life, :string
  end
end
