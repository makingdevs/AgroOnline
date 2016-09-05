require 'test_helper'

class ProviderTest < ActiveSupport::TestCase
  def test_has_many_products
    @provider = Provider.new
    @provider.products.build

    assert_respond_to @provider, :products
  end
end
