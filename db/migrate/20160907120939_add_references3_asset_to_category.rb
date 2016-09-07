class AddReferences3AssetToCategory < ActiveRecord::Migration[5.0]
  def change
    add_reference :categories, :s3_asset, foreign_key: true
  end
end
