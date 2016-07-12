class CreateProviders < ActiveRecord::Migration[5.0]
  def change
    create_table :providers do |t|
      t.string :name
      t.string :lastName
      t.string :country

      t.timestamps
    end
  end
end
