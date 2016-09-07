class AddColumMunicipalityToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :municipality, :string
  end
end
