class Choice < ActiveRecord::Base
  has_many :taggings
  has_many :tags, through: :taggings

  validates :name, presence: true, uniqueness: { scope: :user_id, message: "already exists" }
  validates_associated :tags

  def self.suggest(selections)
    return shuffle if selections.blank?
    choices = Choice.select("choices.id, choices.name, count(tags.id)").
                      joins(:tags).
                      where(:"tags.name" => selections).
                      group("choices.id,choices.name").
                      order("3 desc")
    # Search most matched choice
    choices.blank? ? shuffle : choices.first
  end

  private

    def self.shuffle
      Choice.where(nil).sample(1).first
    end
end
