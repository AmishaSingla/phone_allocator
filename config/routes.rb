Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :phones, only: [:create, :index] do
    post ':phone', on: :collection, action: :create
  end
end
