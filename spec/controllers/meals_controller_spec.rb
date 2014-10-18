require "rails_helper"

RSpec.describe "routing to meals", :type => :routing do
  it "routes /meals to mood/meals#new" do
    expect(:get => "/meals/new").to route_to(:controller => "meals", :action => "new")
  end
end

RSpec.describe MealsController, :type => :controller do
  describe "GET #new" do
    it "responds successfully with an HTTP 200 status code" do
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end

  end

end