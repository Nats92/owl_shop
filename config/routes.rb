Rails.application.routes.draw do
  resources :items do
    get :expensive, on: :collection
  end
end
