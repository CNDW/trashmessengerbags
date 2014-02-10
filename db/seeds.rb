# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'forgery'
Admin.create!(name: 'admin', password: 'password', password_confirmation: 'password', email: 'admin@trashbags.com')

categorization = ['Bags', 'Apparel', 'Utility']
12.times do 
	ProductCategory.create(name: Forgery(:trash).category, desc: Forgery(:trash).sentence, category: categorization.sample)
end

30.times do
	Product.create(name: Forgery(:trash).product, desc: Forgery(:trash).sentence, price: Random.rand(100), product_category: ProductCategory.all.sample)
end
