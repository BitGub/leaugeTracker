RSpec.describe "Sessions(User)", :type => :request do
  
  
  describe "authorization" do
    
    let(:user) { FactoryGirl.create(:user) }
    
    context "when not logged in" do
      it "should not let users access protected pages", :focus do
        visit edit_user_path(user)
        expect(current_path).to eq(signin_path)
      end
    end
  end
    
end