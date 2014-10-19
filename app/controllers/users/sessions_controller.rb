class Users::SessionsController < Devise::SessionsController

  before_action :choice

  def new
  end


  private

  def choice
    @choice ||= Choice.find_by(id: session[:last_choice_id]) if session[:last_choice_id]
  end

end