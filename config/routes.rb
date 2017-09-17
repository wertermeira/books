Rails.application.routes.draw do

  root to: "users#index"
  resources :users, path: "admin/users"

  devise_for :users, :skip => [:registrations]
    as :user do
      get 'user/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
      put 'users' => 'devise/registrations#update', :as => 'user_registration'
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
