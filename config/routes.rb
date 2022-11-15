Rails.application.routes.draw do
  get 'profiles/show'
  get 'profiles/edit'
  get 'profiles/update'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/books/:id" => "books#show"    # Booksコントローラーのshowメソッドを実行する
  delete "/books/:id" => "books#destroy"
  resources :publishers
end
