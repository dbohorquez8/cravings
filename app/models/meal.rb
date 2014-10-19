class Meal < ActiveRecord::Base

  belongs_to :user
  belongs_to :choice

  before_save :guess_occasion

  private

  def guess_occasion
    self.occasion = Occasion.guess unless self.occasion
  end

end
