require 'rails_helper'

RSpec.describe Choice do
  it "is succesfully created" do
    expect(create(:choice)).to be_valid
  end
  
  it "is invalid without a name" do
    expect(build(:choice, name: nil)).not_to be_valid
  end

  it { should have_many :tags }

  it "does not allow duplicates with no user" do
    choice = create(:choice)
    expect(build(:choice, name: choice.name)).not_to be_valid
  end

  # This test requires user model to exist to be ran
  # it "does not allow duplicates for a specific user" do
  #   user = create(:user)
  #   create(:choice, user: user)
  #   expect(build(:choice, user: user)).not_to be_valid
  # end
end
