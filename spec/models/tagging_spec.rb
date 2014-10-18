require 'rails_helper'

RSpec.describe Tagging, :type => :model do
  it "is succesfully created" do
    tag = create(:tag)
    choice = create(:choice)
    expect(create(:tagging, tag: tag, choice: choice)).to be_valid
  end

  it "is invalid without a tag" do
    choice = create(:choice)
    expect(build(:tagging, tag: nil, choice: choice)).not_to be_valid
  end

  it "is invalid without a choice" do
    tag = create(:tag)
    expect(build(:tagging, tag: tag, choice: nil)).not_to be_valid
  end

  it "does not allow duplicates" do
    tag = create(:tag)
    choice = create(:choice)
    create(:tagging, tag: tag, choice: choice)
    expect(build(:tagging, tag: tag, choice: choice)).not_to be_valid
  end

  it { should belong_to :tag }
  it { should belong_to :choice }
end
