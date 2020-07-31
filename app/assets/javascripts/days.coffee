# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

document.addEventListener 'DOMContentLoaded', (event) ->
	submitBtn = document.getElementById('submitOrder')

	submitBtn.onclick = ->
		order_collection = []
		orderDate = document.getElementById('orderDate')
		allLoafs = document.getElementsByClassName('loafType')
		allQuan = document.getElementsByClassName('loafQuantity')
		allSelect = document.querySelectorAll("select");
		console.log("Order Date", orderDate.innerHTML)
		console.log("all Quan", allQuan.length)

		q=0
		qty = []
		while q < allQuan.length
			console.log("Quan",[q],allQuan[q].children[0].value)
			qty.push(allQuan[q].children[0].value)
			q++

		order_collection.push(qty)	
		i=0
		loaf = []
		while i < allSelect.length
			selectElement = allSelect[i];
			console.log("loaf",[i], selectElement.options[selectElement.selectedIndex].text)
			loaf.push(selectElement.options[selectElement.selectedIndex].text)
			i++

		order_collection.push(loaf)
		console.log("Woof", order_collection)
		$.post '/orders',
			order_details: order_collection,
			order_date: orderDate.innerHTML
