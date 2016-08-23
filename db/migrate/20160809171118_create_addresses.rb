class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :street_number
      t.string :suite
      t.string :zip_code
      t.string :colony
      t.string :country
      t.string :city
      t.string :town
      t.string :federal_entity

      t.timestamps
    end
  end
end
