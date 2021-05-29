# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

document.addEventListener 'turbolinks:load', (event) ->
  loafSelection = document.getElementById('js_test')
  loafSelection.onchange = ->
    console.log("mobile", loafSelection.options[loafSelection.selectedIndex].text)
    $.post '/dateToggle',
    	date: loafSelection.options[loafSelection.selectedIndex].text






