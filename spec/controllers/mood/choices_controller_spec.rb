require "rails_helper"

RSpec.describe "routing to choices", :type => :routing do
  it "routes /mood/choices to mood/choices#index" do
    expect(:get => "/mood/choices").to route_to(:controller => "mood/choices", :action => "index")
  end
end

RSpec.describe Mood::ChoicesController, :type => :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

  end

  describe "XHR #index" do

    
  end
end