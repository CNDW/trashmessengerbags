require 'spec_helper'

describe "custom_fields/show" do
  before(:each) do
    @custom_field = assign(:custom_field, stub_model(CustomField,
      :name => "Name",
      :field_type => "Field Type",
      :fieldable => nil,
      :required => false,
      :public => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Field Type/)
    rendered.should match(//)
    rendered.should match(/false/)
    rendered.should match(/false/)
  end
end
