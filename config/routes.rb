Rails.application.routes.draw do
  # get 'products/index'
  # get 'products/show'
  # get 'products/edit'
  # get 'products/new'

  resources :products do
    collection do
      get :export
    end
  end
  resources :products

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
