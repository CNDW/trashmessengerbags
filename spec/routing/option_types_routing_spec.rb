require "spec_helper"

describe OptionTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/option_types").should route_to("option_types#index")
    end

    it "routes to #new" do
      get("/option_types/new").should route_to("option_types#new")
    end

    it "routes to #show" do
      get("/option_types/1").should route_to("option_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/option_types/1/edit").should route_to("option_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/option_types").should route_to("option_types#create")
    end

    it "routes to #update" do
      put("/option_types/1").should route_to("option_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/option_types/1").should route_to("option_types#destroy", :id => "1")
    end

  end
end
