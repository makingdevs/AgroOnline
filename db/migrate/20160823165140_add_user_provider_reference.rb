class AddUserProviderReference < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :provider, foreign_key:true
  end
end
