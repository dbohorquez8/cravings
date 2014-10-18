require 'rails_helper'

RSpec.describe Tag, :type => :model do
  it "is succesfully created" do
    expect(create(:tag)).to be_valid
  end
  
  it "is invalid without a name" do
    expect(build(:tag, name: nil)).not_to be_valid
  end

  it "does not allow duplicates" do
    tag = create(:tag)
    expect(build(:tag, name: tag.name)).not_to be_valid
  end

  it { should have_many :choices }
end
