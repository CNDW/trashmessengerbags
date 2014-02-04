require 'forgery'

FactoryGirl.define do
	factory :product_category, class: ProductCategory do
		name "name"
		price 5
		desc "a desc"
	end
	
end