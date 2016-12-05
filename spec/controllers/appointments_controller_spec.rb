require 'rails_helper'

describe Api::V1::AppointmentsController do
  let!(:appointment) { FactoryGirl.create(:appointment) }

  describe "GET index" do
    it "has a 200 status code" do
      get :index, params: { service_id: appointment.service_id, appointment_id: appointment.id }
      expect(response.status).to eq(200)
    end
  end

  describe "GET show" do
    before(:each) do
      get :show, params: { service_id: appointment.service_id, id: appointment.id }, format: :json
    end

    it "returns the information about an appointment on a hash" do
      appointment_response = json_response
      expect(appointment_response[:description]).to eq(appointment.description)
    end

    it { should respond_with 200 }
  end

  describe "POST create" do
    context "when is successfully created" do
      before(:each) do
        @appointment_attributes = FactoryGirl.build(:appointment).attributes
        post :create, params: { service_id: appointment.service_id, appointment: @appointment_attributes }, format: :json
      end

      it "renders the json representation for the appointment record just created" do
        appointment_response = json_response
        expect(appointment_response[:name]).to eq(@appointment_attributes[:name])
      end

      it { should respond_with 200 }
    end

    context "when is not created" do
      before(:each) do
        @invalid_appointment_attributes = { name: "test" }
        post :create, params: { service_id: appointment.service_id, appointment: @invalid_appointment_attributes }, format: :json
      end

      it "renders an error json" do
        appointment_response = json_response
        expect(appointment_response).to have_key(:errors)
      end

      it "renders the json errors and why could not be created" do
        appointment_response = json_response
        expect(appointment_response[:errors][:user]).to include "must exist"
      end
    end
  end

  describe "PUT #update" do
    context "when is successfully updated" do
      before(:each) do
        patch :update, params: { service_id: appointment.service_id, id: appointment.id, appointment: { description: "test update action" } }, format: :json
      end

      it "renders the json status for the updated appointment" do
        appointment_response = json_response
        expect(appointment_response[:status]).to eql "your appointment was updated"
      end

      it { should respond_with 200 }
    end

    context "when is not created" do
      before(:each) do
        patch :update, params: { service_id: appointment.service_id, id: appointment.id, appointment: { user_id: 30 } }, format: :json
      end

      it "renders an error json" do
        appointment_response = json_response
        expect(appointment_response).to have_key(:errors)
      end

      it "renders the json errors and why the appointment could not be created" do
        appointment_response = json_response
        expect(appointment_response[:errors][:user]).to include "must exist"
      end
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      delete :destroy, params: { service_id: appointment.service_id, id: appointment.id }, format: :json
    end

    it { should respond_with 200 }
  end
end
