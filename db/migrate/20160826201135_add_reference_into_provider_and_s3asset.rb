class AddReferenceIntoProviderAndS3asset < ActiveRecord::Migration[5.0]
  def change
    add_reference :providers, :s3_asset, foreign_key:true
  end
end
