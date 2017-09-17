Rails.application.routes.draw do

  get 'frontend/index'

  get 'frontend/book'

  get 'frontend/books'

  root to: "users#index"
  resources :users, path: "admin/users"
  resources :books, path: "admin/books"

  devise_for :users, :skip => [:registrations]
    as :user do
      get 'user/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
      put 'users' => 'devise/registrations#update', :as => 'user_registration'
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
