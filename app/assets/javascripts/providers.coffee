# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$('select').material_select()

set_map = (address) ->
  mapOptions =
    center: new (google.maps.LatLng)(16.4162631,-99.1646172)
    zoom: 17
    mapTypeId: google.maps.MapTypeId.ROADMAP
  map = new (google.maps.Map)(document.getElementById('map-canvas'), mapOptions)

  geocoder = new (google.maps.Geocoder)
  geocoder.geocode { 'address': address }, (result, status) ->
      map.setCenter result[0].geometry.location
      marker = new (google.maps.Marker)(
        map: map
        position: result[0].geometry.location)
    return
  false

$(document).ready ->
  init_value = if $('.show_address').length then $('.show_address').text() else 'mexico df mexico'
  set_map init_value
  $('.address').on 'change', ->
    getValuesOfClassAddress()
    return
  return

getValuesOfClassAddress = ->
  address = document.getElementsByName("street")[0].value + ',' +
            document.getElementsByName("street_number")[0].value + ',' +
            document.getElementsByName("zip_code")[0].value + ',' +
            document.getElementsByName("colony")[0].value + ',' +
            document.getElementsByName("country")[0].value + ',' +
            document.getElementsByName("city")[0].value + ',' +
            document.getElementsByName("town")[0].value
  set_map address
  return



