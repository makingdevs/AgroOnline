require 'elasticsearch/model'

class Product < ActiveRecord::Base

   include Elasticsearch::Model
   include Elasticsearch::Model::Callbacks

  belongs_to :provider

  has_many :tags
  has_many :s3_assets
end
