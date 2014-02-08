require 'spec_helper'

describe Image do
	before { @image = create(:image) }
	subject { @image }

	it { should be_valid }

  it { should respond_to(:title) }
  it { should respond_to(:image_data) }
  it "should have a thumbnail version" do
    @image.image_data.should respond_to(:thumb)
  end

  describe "builds associations on creation" do
    before { @product = create(:product) }
    subject { @product }

    it { should respond_to(:images) }

    describe "product created image" 
  end

  it "should be assignable to multiple galleries"
  it "should be assignable to a product"
  it "should be assignable to a product category"
  it "should be assignable to a product option"
  it "should should be able to be created by another controller in a nested form"
end
