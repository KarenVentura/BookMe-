require 'api_constraints'

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json }, constraints: { subdomain: 'api' }, path: '/'  do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :services do
        resources :appointments do
          resources :review, only: [:index, :new, :show, :edit, :update]
        end
        resources :schedule
        resources :category
      end

      resources :user do
        resource :perfil
      end
    end
  end
end
