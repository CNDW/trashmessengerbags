require 'spec_helper'

describe "option_types/index" do
  before(:each) do
    assign(:option_types, [
      stub_model(OptionType,
        :name => "Name"
      ),
      stub_model(OptionType,
        :name => "Name"
      )
    ])
  end

  it "renders a list of option_types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
