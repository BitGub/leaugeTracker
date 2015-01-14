require 'rails_helper'

RSpec.describe "Sports", :type => :request do
  
  before(:all) do
    @user = FactoryGirl.create(:user)
  end
  
  before(:each) do
    visit signin_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Sign in'
  end
  
  describe "GET new" do
    context "with valid information" do
      it "should have success message" do
        visit new_sport_path
        
        fill_in 'Name', with: 'Foosball'
        fill_in 'Description', with: 'This is the sport of Foosball'
        click_button 'Create Sport!'
        
        @sport = Sport.first
        
        expect(current_path).to eq sport_path(@sport) 
      end
    end
  end
  
  describe "GET show" do
    before(:each) do
      @sport = FactoryGirl.create(:sport)
    end
    
    it " "
  end
  
  describe "GET Edit" do
    before(:each) do
      @sport = FactoryGirl.create(:sport)
      visit edit_sport_path(@sport)
    end
    
    context "with vaild information" do
      it "updates sports name" do
        fill_in "Name", with: "Sports renamed title"
        click_button "Update"
        
        
        expect(page).to have_css('h1', text: "Sports renamed title")
      end
    end
  end
end
