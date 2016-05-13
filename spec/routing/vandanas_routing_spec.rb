require "rails_helper"

RSpec.describe VandanasController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/vandanas").to route_to("vandanas#index")
    end

    it "routes to #new" do
      expect(:get => "/vandanas/new").to route_to("vandanas#new")
    end

    it "routes to #show" do
      expect(:get => "/vandanas/1").to route_to("vandanas#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/vandanas/1/edit").to route_to("vandanas#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/vandanas").to route_to("vandanas#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/vandanas/1").to route_to("vandanas#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/vandanas/1").to route_to("vandanas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/vandanas/1").to route_to("vandanas#destroy", :id => "1")
    end

  end
end
