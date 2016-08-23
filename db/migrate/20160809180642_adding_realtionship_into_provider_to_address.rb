class AddingRealtionshipIntoProviderToAddress < ActiveRecord::Migration[5.0]
  def change
    add_reference :providers, :address, foreign_key:true
  end
end
