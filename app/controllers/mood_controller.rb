class MoodController < ApplicationController

  def selection
    respond_to do |format|
      format.html do
        @tags = Mood.next_tags
        session[:tags] = @tags.map(&:name).to_json
      end

      format.js do
        previous_tags = session[:tags].blank? ? [] : JSON.parse(session[:tags])
        @tags = Mood.next_tags(previous_tags)
        session[:tags] = (@tags.map(&:name) + previous_tags).to_json
        render json: @tags.to_json, layout: false
      end

      if signed_in?
        render layout: "dashboard"
      end
    end
  end

  def suggestion
    set_offset
    @selections = params[:selections]
    @suggestion = Mood.suggest(@selections, @offset)
    @offset += 1

    if signed_in?
      render layout: "dashboard"
    end
  end

  private

  def set_offset
    @offset ||= params[:offset].to_i
  end

end
