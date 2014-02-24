require 'spec_helper'

describe ProductType do 
	it "has a valid factory" do
		create(:product_type).should be_valid
	end

	it "is invalid without a name" do
		build(:product_type, name: nil).should_not be_valid
	end

	it "has a unique name" do
		create(:product_type, name: 'test')
		build(:product_type, name: 'test').should_not be_valid
	end

	it "is invalid without a type" do
		build(:product_type, category: nil).should_not be_valid
	end

	it "has only alpha-numeric strings in it's fields" do
		bad_format = "[]{}:;()/\\\"\'"
		build(:product_type, name: bad_format, category: bad_format).should_not be_valid
	end

end