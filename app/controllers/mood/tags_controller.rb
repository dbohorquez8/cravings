class Mood::TagsController < ApplicationController

  def index
    @tags = Tag.all.sample(10)
  end

end