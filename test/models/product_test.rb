require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  def test_belongs_to_provider
    @product = Product.new

    assert_respond_to @product, :provider_id
  end

  def test_has_many_s3_assets
    @product = Product.new
    @product.s3_assets.build

    assert_respond_to @product, :s3_assets
  end
end
