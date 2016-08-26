class RenameColumnProvider < ActiveRecord::Migration[5.0]
  def change
    rename_column :providers, :type, :user_type
  end
end
