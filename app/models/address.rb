require 'elasticsearch/model'
class Address < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :address

  def self.createAddress(params)
    address = Address.new()
    address.street = params[:]
    address.street_number = params[:]
    address.suite = params[:]
    address.zip_code = params[:]
    address.colony = params[:]
    address.country = params[:]
    address.city = params[:]
    address.town = params[:]
    address.federal_entity = params[:]
    address.save
    address

  def to_s
    street+" "+street_number+" "+zip_code
  end

end
