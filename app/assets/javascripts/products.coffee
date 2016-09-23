# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
$(document).ready ->
  $('.collapsible').collapsible accordion: false
  $('.materialboxed').materialbox()
  $('#unidad').material_select()
  $('select').material_select()
  $('.chips').material_chip
    secondaryPlaceholder: 'Categorias'
  $('#submit').on 'click', (event) ->
    event.stopPropagation()
    list = []
    $('div.chip').each (i, e) ->
        list.push $(e).text().replace('close', '')
        return
    $('#category_list').val list
    $('#new_product').submit()

  $('.image-miniature').on 'click', ->
    imageSource = $(this).attr("value")
    $('#img-primary').attr 'src', imageSource
    return
