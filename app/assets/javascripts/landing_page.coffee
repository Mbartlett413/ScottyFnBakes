# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

document.addEventListener 'turbolinks:load', (event) ->
  all_dates = document.getElementsByClassName('day_selector')
  mobile_button = document.getElementById('mobile_day_select')
  mobile_day_select = document.getElementById('mobile_date_selection')
  mobile_button.onclick = ->
    console.log("mobile", mobile_day_select.options[mobile_day_select.selectedIndex].text)
    s_date = mobile_day_select.options[mobile_day_select.selectedIndex].text
    $.post '/days',
       this_date: s_date
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






