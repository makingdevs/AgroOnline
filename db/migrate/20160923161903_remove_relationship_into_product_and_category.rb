class RemoveRelationshipIntoProductAndCategory < ActiveRecord::Migration[5.0]
  def change
    remove_reference :products, :category, foreign_key:true
  end
end
