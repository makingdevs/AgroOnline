# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('.parallax').parallax()

  Materialize.scrollFire [ {
    selector: '#image-test'
    offset: 400
    callback: (el) ->
      console.log "tu mama"
      Materialize.showStaggeredList $(el)
      return
  } ]
