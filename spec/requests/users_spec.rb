require 'rails_helper'

RSpec.describe "Users", :type => :request do
  
  let(:user) { FactoryGirl.create(:user)}
  let(:user2) { FactoryGirl.create(:user) }
  let!(:sport) { FactoryGirl.create(:sport, user: user) }
  
  before(:each) do
    visit signin_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
  end

  describe "GET show" do
    context "side navigation" do
      it "users should only see sports created by them", :focus do
        visit user_path(user)

        within("//*[@id='PageContainer']/nav/div[2]") do
          expect(page).to have_css("li >  a", text: sport.name )
        end
      end
      
      it "user should not see sports not created by them", :focus do
          click_link "Sign out"
          visit signin_path
          fill_in 'Email', with: user2.email
          fill_in 'Password', with: user2.password
          click_button 'Sign in'
        visit user_path(user2)

        within("//*[@id='PageContainer']/nav/div[2]") do
          expect(page).not_to have_css("li >  a", text: sport.name )
        end
      end
    end
  end
end