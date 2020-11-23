# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(email: 'Tester@Test.com', password: 'password')

DaysOfWeek.create(title: 'SUNDAY', open: true)
DaysOfWeek.create(title: 'MONDAY', open: true)
DaysOfWeek.create(title: 'TUESDAY', open: true)
DaysOfWeek.create(title: 'WEDNESDAY', open: true)
DaysOfWeek.create(title: 'THURSDAY', open: true)
DaysOfWeek.create(title: 'FRIDAY', open: true)
DaysOfWeek.create(title: 'SATURDAY', open: true)

cat1 = Category.create( active: true, name: 'Sweet', price: 12)
cat2 = Category.create( active: true, name: 'Savory', price: 10)
cat3 = Category.create( active: true, name: 'Savory w/Cheese', price: 12)
cat4 = Category.create( active: true, name: 'Specialty', price: 12)


Loaf.create( name: 'Apple Pie', ingredients: '', active_item: true, price: 0, category_id: cat1.id)
Loaf.create( name: 'Blueberry Lemon Poppyseed', ingredients: '', active_item: true, price: 0, category_id: cat1.id)
Loaf.create( name: 'Cherry Maple Pecan', ingredients: '', active_item: true, price: 0, category_id: cat1.id)
Loaf.create( name: 'Babka', ingredients: '', active_item: true, price: 0, category_id: cat4.id)
Loaf.create( name: 'Brioche', ingredients: '', active_item: true, price: 0, category_id: cat4.id)
Loaf.create( name: 'Challa', ingredients: '', active_item: true, price: 0, category_id: cat4.id)
Loaf.create( name: 'Pumpernickel', ingredients: '', active_item: true, price: 0, category_id: cat4.id)
Loaf.create( name: 'Seasonal', ingredients: '', active_item: true, price: 0, category_id: cat4.id)
Loaf.create( name: 'Apocalypse Bread', ingredients: '', active_item: true, price: 0, category_id: cat3.id)
Loaf.create( name: 'Sun Dried Tomato', ingredients: '', active_item: true, price: 0, category_id: cat3.id)
Loaf.create( name: 'Pesto', ingredients: '', active_item: true, price: 0, category_id: cat3.id)
Loaf.create( name: 'Bacon', ingredients: '', active_item: true, price: 0, category_id: cat3.id)
Loaf.create( name: 'Spinach', ingredients: '', active_item: true, price: 0, category_id: cat3.id)
Loaf.create( name: 'Garlic', ingredients: '', active_item: true, price: 0, category_id: cat2.id)
Loaf.create( name: 'Black Pepper', ingredients: '', active_item: true, price: 0, category_id: cat2.id)
Loaf.create( name: 'Stone Ground Mustard', ingredients: '', active_item: true, price: 0, category_id: cat2.id)
Loaf.create( name: 'Chili Con Carne', ingredients: '', active_item: true, price: 0, category_id: cat2.id)
Loaf.create( name: 'Everything Bagel', ingredients: '', active_item: true, price: 0, category_id: cat2.id)
Loaf.create( name: 'Sourdough', ingredients: '', active_item: true, price: 0, category_id: cat2.id)
 

