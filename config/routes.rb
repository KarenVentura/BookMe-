Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  constraints subdomain: 'api' do
    scope module: 'api' do
      namespace :v1 do
        resources :services do
          resources :appointment do
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
end
