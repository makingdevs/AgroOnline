class CreateS3Assets < ActiveRecord::Migration[5.0]
  def change
    create_table :s3_assets do |t|
      t.string :url_file
      t.string :name_file

      t.timestamps
    end
  end
end
