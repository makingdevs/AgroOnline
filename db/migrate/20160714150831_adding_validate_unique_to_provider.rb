class AddingValidateUniqueToProvider < ActiveRecord::Migration[5.0]
  def change
    remove_column :providers, :nickname
    add_column :providers, :nickname, :string
    add_index :providers, :nickname, unique:true
  end
end
