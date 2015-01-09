require 'rails_helper'

RSpec.describe "Sports", :type => :request do
  
  before(:all) do
    @user = FactoryGirl.create(:user)
  end
  
  describe " /sports/new " do
    
    before(:each) do
      visit signin_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Sign in'
    end
    
    context "with valid information" do
      it "should have success message", :focus do
        visit new_sport_path
        
        fill_in 'Name', with: 'Foosball'
        fill_in 'Description', with: 'This is the sport of Foosball'
        click_button 'Create Sport!'
        
        expect(page).to have_css(".success") 
      end
    end
  end
end
