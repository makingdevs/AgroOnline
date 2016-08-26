class AddTypeTo < ActiveRecord::Migration[5.0]
  def change
    add_column :providers, :type, :string
  end
end
