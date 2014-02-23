require 'spec_helper'

describe "custom_fields/index" do
  before(:each) do
    assign(:custom_fields, [
      stub_model(CustomField,
        :name => "Name",
        :field_type => "Field Type",
        :fieldable => nil,
        :required => false,
        :public => false
      ),
      stub_model(CustomField,
        :name => "Name",
        :field_type => "Field Type",
        :fieldable => nil,
        :required => false,
        :public => false
      )
    ])
  end

  it "renders a list of custom_fields" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Field Type".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
