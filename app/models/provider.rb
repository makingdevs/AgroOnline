require 'elasticsearch/model'

class Provider < ApplicationRecord
   include Elasticsearch::Model
   include Elasticsearch::Model::Callbacks

  has_many :products
  belongs_to :address
  belongs_to :user
  belongs_to :s3_asset, optional:true

  def to_s
     name.capitalize + " " + lastName.capitalize
   end
end
