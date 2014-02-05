require 'forgery'

categorization = ['Bags', 'Apparel', 'Utility']

FactoryGirl.define do

	factory :product do
		sequence(:name) {|n| "Product #{n}"}
		desc Forgery(:trash).sentence
		price Forgery(:monetary).money min: 10, max: 400
	end
	

	factory :product_category do
		sequence(:name) {|n| "Category #{n}"}
		desc Forgery(:trash).sentence
		category categorization.sample
	end
	
end