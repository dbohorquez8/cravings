class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :choices, through: :taggings

  validates :name, presence: true, uniqueness: true
  validates_associated :choices

  def as_json(options={})
    {:name => name, :picture => picture_url}
  end

end
