class Mood

  def self.next_tags(previous_tags = [])
    chosen_tag_ids = Tagging.select("tag_id").all.uniq
    tags = Tag.where(id: chosen_tag_ids).where.not(name: previous_tags)
    tags.sample(10)
  end

end
