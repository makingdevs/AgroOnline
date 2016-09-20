# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$('select').material_select()
$('.modal-trigger').leanModal()

$(document).ready ->
  init_value = if $('.show_address').length then $('.show_address').text() else 'mexico df mexico'
  set_map init_value

  $('.address').on 'change', ->
    getValuesOfClassAddress()
    return
  $('#zip_code').on 'change', ->
    sepomexServiceCp document.getElementsByName("zip_code")[0].value
    return
  $('#content-model-address').on 'click','.collection-item', ->
      id = this.id
      setArgumentsInForm( getElementsbyLiClick id )
      $('#model1').closeModal()
    return
  return

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
        draggable: true
        position: result[0].geometry.location)
      google.maps.event.addListener marker, 'dragend', (event) ->
        console.log this.getPosition().lat()
        console.log this.getPosition().lng()
    return
  false


sepomexServiceCp = (cp) ->
  Sepomex.where {
    'cp': cp
  }, (response) ->
    if response.length > 1
      setArgumentsInModalSection response
      $('#modal1').openModal()
    else
      value = response[0]
      setArgumentsInForm value
  return

setArgumentsInModalSection = (response) ->
  $.each response, (key, value) ->
    colonia = value.d_asenta
    ciudad = value.d_ciudad
    estado = value.d_estado
    municipio = value.d_mnpio
    id = value.id
    li = '<li class="collection-item avatar" id="'+id+'"><i class="material-icons circle green">assessment</i><span class="title">Colonia:'+colonia+' </span><p>Ciudad:'+ciudad+'<br> Estado:'+estado+'<br> Municipio: '+municipio+' </p> <input type="hidden" value="'+colonia+'" id="colony-'+id+'" /><input type="hidden" value="'+ciudad+'" id="city-'+id+'" /><input type="hidden" value="'+estado+'" id="federal_entity-'+id+'" /> <input type="hidden" value="'+municipio+'" id="town-'+id+'" /></li>'
    $("#content-model-address").append(li)
    return
  return

setArgumentsInForm = (response) ->
  console.log response.d_asenta
  $("input[name='colony']").val(response.d_asenta)
  $("input[name='city']").val(response.d_ciudad)
  $("input[name='town']").val(response.d_mnpio)
  $("input[name='federal_entity']").val(response.d_estado)
  $("input[name='country']").val("México")
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

getElementsbyLiClick = (id) ->
  colony = $('#colony-'+id).val()
  city = $('#city-'+id).val()
  town = $('#town-'+id).val()
  federal_entity = $('#federal_entity-'+id).val()
  arr = {d_asenta: colony, d_ciudad: city, d_mnpio: town, d_estado: federal_entity}
  return arr
