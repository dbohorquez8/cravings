class Mood

  def self.next_tags(previous_tags = [])
    chosen_tag_ids = Tagging.select("tag_id").all.uniq
    tags = Tag.where(id: chosen_tag_ids).where.not(name: previous_tags)
    tags.sample(10)
  end

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
