require 'rails_helper'

RSpec.describe Mood do

  before do
    20.times { create(:tag) }
  end
  describe "#next_tags" do
    it "returns a sample of 10 tags when no parameters are passed" do
      expect(Mood.next_tags.count).to be_equal 10
    end
    
    it "returns a sample of 10 tags when passing nil as parameter" do
      expect(Mood.next_tags(nil).count).to be_equal 10
    end
  end
end
