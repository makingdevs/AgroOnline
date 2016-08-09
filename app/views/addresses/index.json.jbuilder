json.array!(@addresses) do |address|
  json.extract! address, :id, :street, :street_number, :suite, :zip_code, :colony, :country, :city, :town, :federal_entity
  json.url address_url(address, format: :json)
end
