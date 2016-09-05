require 'test_helper'

class S3AssetTest < ActiveSupport::TestCase
  def test_belongs_to_product
    @s3_asset = S3Asset.new

    assert_respond_to @s3_asset, :product_id
  end
end
