require 'addressManager/address_manager'

class ProviderManager

  def createProviders(paramsProviders)
    providers = []
    paramsProviders.each { | providerRow |
      providerExist = Provider.find_by nickname: "#{providerRow[2]}"
      if !providerExist
        address = @addressManager.createAddress(providerRow)
        provider = Provider.createProvider(providerRow,address)
      end

    }
    providers
  end

end
