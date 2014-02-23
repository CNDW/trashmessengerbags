require "spec_helper"

describe CustomFieldsController do
  describe "routing" do

    it "routes to #index" do
      get("/custom_fields").should route_to("custom_fields#index")
    end

    it "routes to #new" do
      get("/custom_fields/new").should route_to("custom_fields#new")
    end

    it "routes to #show" do
      get("/custom_fields/1").should route_to("custom_fields#show", :id => "1")
    end

    it "routes to #edit" do
      get("/custom_fields/1/edit").should route_to("custom_fields#edit", :id => "1")
    end

    it "routes to #create" do
      post("/custom_fields").should route_to("custom_fields#create")
    end

    it "routes to #update" do
      put("/custom_fields/1").should route_to("custom_fields#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/custom_fields/1").should route_to("custom_fields#destroy", :id => "1")
    end

  end
end
