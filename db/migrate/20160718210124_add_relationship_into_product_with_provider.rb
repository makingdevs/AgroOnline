class AddRelationshipIntoProductWithProvider < ActiveRecord::Migration[5.0]
  def change
    remove_reference :providers, :product, foreign_key: true
  end
end
