class AddRelationIntoProviderUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :providers, :user, foreign_key:true
  end
end
