class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :choices, through: :taggings

  validates :name, presence: true, uniqueness: true
  validates_associated :choices

  def to_json
    name
  end

end
