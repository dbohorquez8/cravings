class Mood::TagsController < ApplicationController

  def index
    @tags = (1..10).to_a
  end

end