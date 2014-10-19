class MealsController < ApplicationController

  before_action :choice, :only => [:create]
  before_action :authenticate_user!, :only => [:index, :create]

  def index
    @meals = current_user.meals.includes(:choice).order("created_at desc")
    @metric_data = Metrics.most_frequent_tags_data(current_user)
  end

  def new
    @choices = Choice.all.map { |choice| choice.name.titleize }
  end

  def create
    if @meal = current_user.meals.create(choice: choice, occasion: params[:occasion])
      flash[:success] = "Bon appetit!"
      redirect_to meals_path
    else
      flash[:error] = @meal.errors.full_messages.to_sentence
      render :new
    end
  end
  
  private

  def choice
    @choice ||= begin
                  choice = Choice.find_by!(name: params[:choice].downcase)
                  session[:last_choice_id] = choice.id
                  choice
                end
  end

end
