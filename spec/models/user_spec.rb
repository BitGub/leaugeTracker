require 'rails_helper'

RSpec.describe User do
  
  before(:each) do
    @user = FactoryGirl.create(:user)
  end
  
  it { should respond_to(:name) }
end