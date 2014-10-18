class Mood

  def self.next_tags(previous_tags = [])
    tags = Tag.where.not(name: previous_tags)
    tags.sample(10)
  end

end