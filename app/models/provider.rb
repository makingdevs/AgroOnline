require 'elasticsearch/model'

class Provider < ApplicationRecord
   include Elasticsearch::Model
   include Elasticsearch::Model::Callbacks

  has_many :products
  belongs_to :user
  belongs_to :address
  validates :nickname, presence: true

  def self.createProvider(params,address)
    provider = Provider.new()
    provider.name = params[0]
    provider.lastName = params[1]
    provider.nickname = params[2]
    provider.country = "Mexico"
    provider.addres = address
    provider.save
    provider
  end

  def to_s
     name.capitalize + " " + lastName.capitalize
   end
end
