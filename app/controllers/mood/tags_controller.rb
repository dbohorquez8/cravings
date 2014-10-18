class Mood::TagsController < ApplicationController

  def index
    previous_tags = session[:tags].blank? ? [] : JSON.parse(session[:tags])
    @tags = Mood.next_tags(previous_tags)
    session[:tags] = @tags.concat(previous_tags).to_json

    respond_to do |format|
      format.html
      format.js { render json: @tags.to_json, layout: false }
    end
  end

end