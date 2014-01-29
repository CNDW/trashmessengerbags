#spec/models/product_category.rb
require 'spec_helper'

describe ProductCategory do 
	it "has a valid factory" do
		FactoryGirl.create(:product_category).should be_valid
	end
	it "is invalid without a name" do
		FactoryGirl.build(:product_category, name: nil).should_not be_valid
	end
	it "has a unique name" do
		FactoryGirl.create(:product_category, name: 'test')
		FactoryGirl.build(:product_category, name: 'test').should_not be_valid
	end
	it "returns a list of it's own product_types as an array of names"
end