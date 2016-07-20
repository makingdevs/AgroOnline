class Provider < ApplicationRecord

  has_many :products

  validates :nickname, presence: true

  def self.createProvider(params)
    provider = Provider.new()
    provider.name = params[0]
    provider.lastName = params[1]
    provider.nickname = params[2]
    provider.country = "Mexico"
    provider.save
    provider
  end

  def to_s
     name + " " + lastName
   end
end
