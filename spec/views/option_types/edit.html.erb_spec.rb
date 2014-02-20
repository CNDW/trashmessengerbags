require 'spec_helper'

describe "option_types/edit" do
  before(:each) do
    @option_type = assign(:option_type, stub_model(OptionType,
      :name => "MyString"
    ))
  end

  it "renders the edit option_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", option_type_path(@option_type), "post" do
      assert_select "input#option_type_name[name=?]", "option_type[name]"
    end
  end
end
