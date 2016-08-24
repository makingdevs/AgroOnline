class DeleteCountryAndAddTelephone < ActiveRecord::Migration[5.0]
  def change
    remove_column :providers, :country
    add_column :providers, :telephone, :integer
  end
end
