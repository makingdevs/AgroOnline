class Provider < ApplicationRecord

  def self.createProvider(params)
    provider = Provider.new()
    provider.name = params[0]
    provider.lastName = params[1]
    provider.country = "Mexico"
    provider.save
    provider
  end
end
