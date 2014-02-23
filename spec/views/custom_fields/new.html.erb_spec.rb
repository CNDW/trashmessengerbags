require 'spec_helper'

describe "custom_fields/new" do
  before(:each) do
    assign(:custom_field, stub_model(CustomField,
      :name => "MyString",
      :field_type => "MyString",
      :fieldable => nil,
      :required => false,
      :public => false
    ).as_new_record)
  end

  it "renders new custom_field form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", custom_fields_path, "post" do
      assert_select "input#custom_field_name[name=?]", "custom_field[name]"
      assert_select "input#custom_field_field_type[name=?]", "custom_field[field_type]"
      assert_select "input#custom_field_fieldable[name=?]", "custom_field[fieldable]"
      assert_select "input#custom_field_required[name=?]", "custom_field[required]"
      assert_select "input#custom_field_public[name=?]", "custom_field[public]"
    end
  end
end
