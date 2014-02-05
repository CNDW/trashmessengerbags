#spec/models/product_category.rb
require 'spec_helper'

describe ProductCategory do 
	it "has a valid factory" do
		create(:product_category).should be_valid
	end

	it "is invalid without a name" do
		build(:product_category, name: nil).should_not be_valid
	end

	it "has a unique name" do
		create(:product_category, name: 'test')
		build(:product_category, name: 'test').should_not be_valid
	end

	it "is invalid without a category" do
		build(:product_category, category: nil).should_not be_valid
	end

	it "has only alpha-numeric strings in it's fields" do
		bad_format = "[]{}:;()/\\\"\'"
		build(:product_category, name: bad_format, category: bad_format, desc: bad_format).should_not be_valid
	end

end