require 'rails_helper'

describe UsersController, :type => :controller do

  before do
    @user = User.create!(email: "test222@test.com", password: "test222")
    @user = User.create!(email: "test333@test.com", password: "test333")
  end


  describe "GET #show" do
     context "User is logged in" do
      before do 
      sign_in @user
    end
  end
  
  it "loads correct user details" do
     get :show, id: @user.id
     expect(response).to have_http_status(302)
     expect(assigns(:user)).to eq @user
   end

   context "incorrect user" do
     it "redirects to login" do
      get :show, id: @user.id
      expect(assigns(:user)).not_to eq @user_two
      expect(response).to redirect_to(root_path)
    end
  end


    
    context "No user is logged in" do
      it "redirects to login" do
        get :show, id: @user.id
        expect(response).to redirect_to(root_path)
        expect(assigns(:user)).to eq @user
      end
    end
 end
end


#before do
  #here you put your code to generate test content
  # @user = User.create!(name: "test", email: "testtest1@test.com", password: "testtest")
  # it "loads correct user details" do
#end