class Tagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :choice

  validates :tag_id, presence: true, uniqueness: { scope: :choice_id, message: "already exists" }
  validates :choice_id, presence: true, uniqueness: { scope: :tag_id, message: "already exists" }
  validates_associated :tag
  validates_associated :choice
end
