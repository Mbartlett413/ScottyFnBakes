# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

document.addEventListener 'DOMContentLoaded', (event) ->
  all_dates = document.getElementsByClassName('day_selector')
  i = 0
  while i < all_dates.length

  	all_dates[i].onclick = ->
  		console.log("here", @parentElement.children[0].innerHTML)
  		console.log("here", @parentElement.firstElementChild.innerHTML)
  		s_date = @parentElement.firstElementChild.innerHTML
  		false
  		$.post '/days',
  	     this_date: s_date
  	i++
  return




