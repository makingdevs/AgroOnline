class AddRelationshipIntoProductWithProvidersw < ActiveRecord::Migration[5.0]
  def change
    add_reference :products, :provider, foreign_key:true
  end
end
