@getPlaces = ->
  failure = ->
    alert 'problem getting location'
  $('.get_location').each (index) ->
    $(this).on 'click', (event) ->
    navigator.geolocation.getCurrentPosition ((position) ->
    $.ajax
    type: 'PUT'
    url: '/places/get_locations' + '?latitude=' + position.coords.latitude + '&longitude=' + position.coords.longitude
    ), failure,
    enableHighAccuracy: true
    timeout: 5000
    event.preventDefault()
$(document).on('turbolinks:load', @getPlaces)
