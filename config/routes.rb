Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#api'

  devise_for :users, skip: [:registrations, :sessions, :passwords]
  devise_scope :user do
    post   "/v1/users/sign_up"  => "api/v1/registrations#create", constraints: { subdomain: 'api' }
    post   "/v1/users/sign_in"  => "api/v1/sessions#create", constraints: { subdomain: 'api' }
    delete "/v1/users/sign_out" => "api/v1/sessions#destroy", constraints: { subdomain: 'api' }
    patch  "/v1/users/password" => "api/v1/passwords#update",constraints: { subdomain: 'api' }
    post   "/v1/users/password" => "api/v1/passwords#create", constraints: { subdomain: 'api' }
  end
  scope module: 'api' do
    namespace 'v1' do
      get 'check_token' => 'users#check_token'
    end
  end

end
