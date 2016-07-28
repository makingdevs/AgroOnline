require 'elasticsearch/model'

class Product < ActiveRecord::Base

   include Elasticsearch::Model
   include Elasticsearch::Model::Callbacks

  belongs_to :category
  belongs_to :provider

  def self.createProduct(params,category)
    product = Product.new()
    product.name = params[0]
    product.sku = params[1]
    product.price = params[2]
    product.weight = params[3]
    product.min_order_quantity = params[4]
    product.origin = params[5]
    product.packaging = params[6]
    product.category = category
    product.save
    product
  end

end
