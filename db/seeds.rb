# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'
Admin.create!(name: 'admin', password: 'password', password_confirmation: 'password', email: 'admin@trashbags.com')

categorization = ['Bags', 'Apparel', 'Utility']
16.times do 
	ProductCategory.create(name: Faker::Commerce.department, desc: Faker::Lorem.sentence, category: categorization.sample)
end

30.times do
	Product.create(name: Faker::Commerce.product_name, desc: Faker::Lorem.sentence, price: Random.rand(100), product_category: ProductCategory.all.sample)
end

15.times do
	ProductOption.create(name: Faker::Commerce.color, desc: Faker::Lorem.sentence, price: Random.rand(50), products: Product.all.sample(6))
end