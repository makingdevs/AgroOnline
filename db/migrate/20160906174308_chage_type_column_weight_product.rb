class ChageTypeColumnWeightProduct < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :weight,  :string
  end
end
