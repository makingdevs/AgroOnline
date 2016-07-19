class ProviderManager

  def createProviders(paramsProviders)
    providers = []
    paramsProviders.each { | providerRow |
      providerExist = Provider.find_by nickname: "#{providerRow[2]}"
      if !providerExist
        providers << Provider.createProvider(providerRow)
      end

    }
    providers
  end

end
