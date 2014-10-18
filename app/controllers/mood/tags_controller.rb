class Mood::TagsController < ApplicationController

  def index
    @tags = Mood.next_tags(session[:tags])
    session[:tags] = @tags.to_json.concat(session[:tags].to_a).to_json

    respond_to do |format|
      format.html
      format.js { render json: @tags.to_json, layout: false }
    end
  end

end