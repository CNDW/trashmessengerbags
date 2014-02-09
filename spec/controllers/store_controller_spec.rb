require 'spec_helper'

describe StoreController do

  describe "GET 'catalogue'" do
    it "returns http success" do
      get 'catalogue'
      response.should be_success
    end
  end

  describe "GET 'premade'" do
    it "returns http success" do
      get 'premade'
      response.should be_success
    end
  end

  describe "GET 'custom'" do
    it "returns http success" do
      get 'custom'
      response.should be_success
    end
  end

end
