class RemoveNicknameToProvider < ActiveRecord::Migration[5.0]
  def change
    remove_column :providers, :nickname
  end
end
