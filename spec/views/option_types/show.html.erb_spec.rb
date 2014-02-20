require 'spec_helper'

describe "option_types/show" do
  before(:each) do
    @option_type = assign(:option_type, stub_model(OptionType,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
