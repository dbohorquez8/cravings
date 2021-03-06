class Occasion

  DEFAULT_OCCASIONS = {
    breakfast: (5...11),
    lunch: (11...16)
  }

  def self.guess(time = Time.now, ranges = DEFAULT_OCCASIONS, default_occasion = 'dinner')
    value = ranges.select{|key, value| value.include_with_range?(time.hour)}
    value.blank? ? default_occasion : value.keys.first.to_s
  end

end