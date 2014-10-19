class Metrics

  def self.most_frequent_tags_for(user)
    Tag.select("tags.id, tags.name, count(tags.id) as tag_count").joins(:choices).where(:"choices.id" => user.meals.pluck(:choice_id)).group("tags.name, tags.id").order("3 desc")
  end

  def self.most_frequent_tags_data(user)
    tags = self.most_frequent_tags_for(user).limit(10)
    data = tags.map {|t| [t.name.capitalize, t.tag_count]}
    data = [["Selection", "Count"]] + data
  end

end