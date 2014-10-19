require "rails_helper"

RSpec.describe "routing to mood", :type => :routing do
  it "routes /mood/selection to mood#selection" do
    expect(:get => "/mood/selection").to route_to(:controller => "mood", :action => "selection")
  end

  it "routes /mood/suggestion to mood#suggestion" do
    expect(:get => "/mood/suggestion").to route_to(:controller => "mood", :action => "suggestion")
  end
end

RSpec.describe MoodController, :type => :controller do

  before do
    @choice = create(:choice)
    20.times { create(:tag)}
    @tags = Tag.all
    @chosen_tags_count = 10
    @chosen_tags = @tags.sample(@chosen_tags_count)
    @choice.tags << @chosen_tags
  end

  describe "GET #selection" do
    it "responds successfully with an HTTP 200 status code" do
      get :selection
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the selection template" do
      get :selection
      expect(response).to render_template("selection")
    end

    it "loads 10 tags" do
      get :selection
      expect(assigns(:tags).count).to be_equal 10
    end
  end

end
