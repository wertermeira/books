Rails.application.routes.draw do
  root to: "frontend#index"
  get 'books', to: "frontend#books", as: "frontend_books"

  get 'book/:id', to: "frontend#book", as: "frontend_book"




  resources :users, path: "admin/users"
  resources :books, path: "admin/books"

  devise_for :users, :skip => [:registrations]
    as :user do
      get 'user/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
      put 'users' => 'devise/registrations#update', :as => 'user_registration'
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
