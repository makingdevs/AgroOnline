# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
$(document).ready ->
  $('.carousel').carousel interval: 3000
  fadingSlider()
  staffSlider()
  $('.achivement-item').one 'inview', (event, visible) ->
    if visible == true
      $('.achivement-item__marker.start-1').addClass 'zoomIn'
      $('.achivement-item__marker.start-2').addClass 'zoomIn stage2'
      $('.achivement-item__marker.start-3').addClass 'zoomIn stage3'
    return

  $('.promo__btn').one 'inview', (event, visible) ->
    if visible == true
      $('.promo__btn').addClass 'fadeInUp'
      setTimeout (->
        $('.promo__btn').removeClass 'fadeInUpStart'
        return
      ), 1000
    return


  $('.about ').one 'inview', (event, visible) ->
    if visible == true
      $('.about-img').addClass 'fadeInUp'

    return
  return
