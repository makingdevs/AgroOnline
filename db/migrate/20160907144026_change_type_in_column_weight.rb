class ChangeTypeInColumnWeight < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :weight
    add_column :products, :weight,  :float
  end
end
