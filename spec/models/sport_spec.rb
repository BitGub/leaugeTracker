require 'rails_helper'

RSpec.describe Sport, :type => :model do
  
  before(:each) do
    @user = FactoryGirl.create(:user)
    @sport = FactoryGirl.build(:sport, user: @user)
  end
  
  it "should have user_id" do
    @sport.user_id = nil
    expect(@sport).not_to be_valid
  end
  
  it "should belong to @user", :focus do
    expect(@sport.user_id).to eq(@user.id)
  end
end
