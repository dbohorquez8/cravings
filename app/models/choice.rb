class Choice < ActiveRecord::Base
  has_many :taggings
  has_many :tags, through: :taggings

  validates :name, presence: true, uniqueness: { scope: :user_id, message: "already exists" }
  validates_associated :tags

end
