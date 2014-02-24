include ActionDispatch::TestProcess
require 'forgery'

categorization = ['Bags', 'Apparel', 'Utility']

FactoryGirl.define do

	factory :product do
		sequence(:name) {|n| "Product #{n}"}
		price { Forgery(:monetary).money min: 10, max: 400 }
	end
	

	factory :product_type do
		sequence(:name) {|n| "Product Type #{n}"}
		category { categorization.sample }
	end
	
	factory :image do
		sequence(:title) {|n| "Image Title #{n}"}
		sequence(:name) {|n| "Image name #{n}"}
		image_data { fixture_file_upload( Rails.root + 'spec/support/test_images/bag1.jpg', "image/jpg" ) }

		after(:image_data) { image_data.close }
	end

end