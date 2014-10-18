require "rails_helper"

RSpec.describe "routing to tags", :type => :routing do
  it "routes /mood/tags to mood/tags#index" do
    expect(:get => "/mood/tags").to route_to(:controller => "mood/tags", :action => "index")
  end
end

RSpec.describe Mood::TagsController, :type => :controller do

  before(:all) do
    10.times { create(:tag)}
  end

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

    it "loads 10 tags" do
      get :index
      expect(assigns(:tags).count).to be_equal 10
    end
  end

  describe "XHR #index" do

    it "loads 10 tags" do
      get :index
      expect(assigns(:tags).count).to be_equal 10
    end
    
  end
end