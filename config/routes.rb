Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"
  devise_for :users
  root to: 'pages#home'
   get "home/index" =>"home#index"
   get "/team" => "pages#team"
   
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
