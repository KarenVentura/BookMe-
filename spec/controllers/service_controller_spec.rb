require 'rails_helper'

describe Service do
  context 'index service' do
    let(:service) { Service.create(name: "Dentist", description: "dentist", week_days: "L,M,M,J,V") }

    it 'renders service' do
      get :index
      expect(response).to render_template :index
    end
  end
end
