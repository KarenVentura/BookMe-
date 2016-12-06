require 'rails_helper'

describe Api::V1::ServicesController do
  let!(:service) { FactoryGirl.create(:service) }

  describe "GET index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "GET show" do
    before(:each) do
      get :show, params: { id: service.id }, format: :json
    end

    it "returns the information about a service on a hash" do
      service_response
      expect(service_response[:name]).to eq(service.name)
    end

    it { should respond_with 200 }
  end

  describe "POST create" do
    context "when is successfully created" do
      before(:each) do
        @service_attributes = FactoryGirl.build(:service).attributes
        post :create, params: { service: @service_attributes }, format: :json
      end

      it "renders the json representation for the service record just created" do
        service_response
        expect(service_response[:name]).to eq(@service_attributes[:name])
      end

      it { should respond_with 200 }
    end

    context "when is not created" do
      before(:each) do
        @invalid_service_attributes = { name: "test" }
        post :create, params: { service: @invalid_service_attributes }, format: :json
      end

      it "renders an error json" do
        service_response
        expect(service_response).to have_key(:errors)
      end

      it "renders the json errors and why could not be created" do
        service_response
        expect(service_response[:errors][:user]).to include "must exist"
      end
    end
  end

  describe "PUT #update" do
    context "when is successfully updated" do
      before(:each) do
        patch :update, params: { id: service.id, service: { name: "updated" } }, format: :json
      end

      it "renders the json status for the updated service" do
        service_response
        expect(service_response[:status]).to eql "your service was updated"
      end

      it { should respond_with 200 }
    end

    context "when is not created" do
      before(:each) do
        patch :update, params: { id: service.id, service: { user_id: 30 } }, format: :json
      end

      it "renders an error json" do
        service_response
        expect(service_response).to have_key(:errors)
      end

      it "renders the json errors and why the service could not be created" do
        service_response
        expect(service_response[:errors][:user]).to include "must exist"
      end
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      delete :destroy, params: { id: service.id }, format: :json
    end

    it { should respond_with 200 }
  end

  def service_response
    JSON.parse(response.body, symbolize_names: true)
  end
end

