Rails.application.routes.draw do
  root "people#index"
  get "signin" => "sessions#new", as: :signin
  post "signin" => "sessions#create"
  get "signout" => "sessions#destroy", as: :signout

  resources :locations, only: :index
  resources :people do
    resources :assignments
    delete "assignments" => "assignments#destroy", as: :delete_assignment
  end
end
