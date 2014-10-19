require 'rails_helper'

RSpec.describe Mood do

  before do
    @choice = create(:choice)
    20.times { create(:tag) }
    @tags = Tag.all
    @chosen_tags_count = 10
    @chosen_tags = @tags.sample(@chosen_tags_count)
    @choice.tags << @chosen_tags
  end

  describe "#next_tags" do
    it "returns a sample of 10 tags when no parameters are passed" do
      expect(Mood.next_tags.count).to be_equal @chosen_tags_count
    end

    it "returns a sample of 10 tags when passing nil as parameter" do
      expect(Mood.next_tags(nil).count).to be_equal @chosen_tags_count
    end

    it "returns only tags that are currently in use by choices" do
      p @chosen_tags
      expect(Mood.next_tags).not_to include(@tags - @chosen_tags)
    end
  end
end
