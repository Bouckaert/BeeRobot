Robobier::Application.routes.draw do

resources :users do
resources :comments
end



  root 'static_pages#home'
  
  match '/signup',  to: 'users#new', via: 'get'
  match '/help', to: 'static_pages#help', via: 'get'
  match '/about', to: 'static_pages#about', via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'

#  root to: "welcome#index"
#  get "users/new"

end
