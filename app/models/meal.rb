class Meal < ActiveRecord::Base

  belongs_to :user
  belongs_to :choice

  before_save :guess_occasion

  OCCASIONS = {
    breakfast: (5...11),
    lunch: (11...16)
  }

  private

  def guess_occasion
    value = OCCASIONS.select{|key, value| value.include_with_range?(Time.now.hour)}
    self.occasion = value ? value.keys.first.to_s : 'dinner'
  end

end
