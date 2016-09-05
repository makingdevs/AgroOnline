require 'elasticsearch/model'

class Product < ActiveRecord::Base

   include Elasticsearch::Model
   include Elasticsearch::Model::Callbacks

  belongs_to :category
  belongs_to :provider

  has_many :s3_assets
end
