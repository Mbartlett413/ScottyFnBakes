# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

document.addEventListener 'turbolinks:load', (event) ->
  edit_date_selection = document.getElementById('edit_date_selection')
  edit_date  = document.getElementById('edit_date')
  edit_date.onclick = ->
    console.log("mobile", edit_date_selection.options[edit_date_selection.selectedIndex].text)
    s_date = edit_date_selection.options[edit_date_selection.selectedIndex].text
    $.post '/days',
      this_date: s_date





