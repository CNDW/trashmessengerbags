require 'faker'

FactoryGirl.define do
	factory :product_category, class: ProductCategory do
		name Faker::Commerce.product_name
		price Faker::Number.number(3)
		desc Faker::Lorem.sentence
		id Faker::Number.number(2)
	end
	
end