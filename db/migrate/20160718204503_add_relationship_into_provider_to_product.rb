class AddRelationshipIntoProviderToProduct < ActiveRecord::Migration[5.0]
  def change
    add_reference :providers, :product, foreign_key: true
  end
end
