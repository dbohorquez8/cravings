class Mood

  def self.next_tags(previous_tags = [])
    tags = Tag.all.map(&:name) - previous_tags.to_a
    tags.sample(10)
  end

end