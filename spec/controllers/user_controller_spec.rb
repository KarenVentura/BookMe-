require 'rails_helper'

describe Api::V1::UsersController do
  before(:each) { request.headers['Accept'] = "application/api.lvh.me:3000.v1" }

  describe "GET index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "GET show" do
    let(:user) { FactoryGirl.create(:user) }

    before(:each) do
      get :show, params: { id: user.id }, format: :json
    end

    it "returns the information about a service on a hash" do
      user_response
      expect(user_response[:name]).to eq(user.name)
    end

    it { should respond_with 200 }
  end

  describe "POST create" do
    context "when is successfully created" do
      before(:each) do
        @user_attributes = FactoryGirl.build(:user).attributes
        post :create, params: { user: @user_attributes }, format: :json
      end

      it "renders the json representation for the user record just created" do
        user_response
        expect(user_response[:email]).to eq(@user_attributes[:email])
      end

      it { should respond_with 201 }
    end

    context "when is not created" do
      before(:each) do
        @invalid_user_attributes = { password: "12345678",
                                     password_confirmation: "12345678" }
        post :create, params: { user: @invalid_user_attributes }, format: :json
      end

      it "renders an error json" do
        user_response
        expect(user_response).to have_key(:errors)
      end

      it "renders the json errors and why could not be created" do
        user_response
        expect(user_response[:errors][:email]).to include "can't be blank"
      end

      it { should respond_with 422 }
    end
  end

  describe "PUT/PATCH #update" do

    context "when is successfully updated" do
      before(:each) do
        @user = FactoryGirl.create :user
        patch :update, params: { id: @user.id, user: { email: "newmail@example.com" } }, format: :json
      end

      it "renders the json representation for the updated user" do
        user_response
        expect(user_response[:email]).to eql "newmail@example.com"
      end

      it { should respond_with 200 }
    end

    context "when is not created" do
      before(:each) do
        @user = FactoryGirl.create :user
        patch :update, params: { id: @user.id, user: { email: "bademail.com" } }, format: :json
      end

      it "renders an errors json" do
        user_response
        expect(user_response).to have_key(:errors)
      end

      it "renders the json errors on whye the user could not be created" do
        user_response
        expect(user_response[:errors][:email]).to include "is invalid"
      end

      it { should respond_with 422 }
    end
  end

  describe "DELETE #destroy" do
    let(:user) { FactoryGirl.create(:user) }

    before(:each) do
      delete :destroy, params: { id: user.id }, format: :json
    end

    it { should respond_with 204 }
  end

  def user_response
    JSON.parse(response.body, symbolize_names: true)
  end
end

