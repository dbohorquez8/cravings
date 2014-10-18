class Mood::TagsController < ApplicationController

  def index
    respond_to do |format|
      format.html do
        @tags = Mood.next_tags
        session[:tags] = @tags.to_json
      end

      format.js do
        previous_tags = session[:tags].blank? ? [] : JSON.parse(session[:tags])
        @tags = Mood.next_tags(previous_tags)
        session[:tags] = (@tags + previous_tags).to_json
        render json: @tags.to_json, layout: false
      end
    end
  end

end