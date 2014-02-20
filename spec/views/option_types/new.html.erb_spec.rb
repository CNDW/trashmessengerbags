require 'spec_helper'

describe "option_types/new" do
  before(:each) do
    assign(:option_type, stub_model(OptionType,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new option_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", option_types_path, "post" do
      assert_select "input#option_type_name[name=?]", "option_type[name]"
    end
  end
end
