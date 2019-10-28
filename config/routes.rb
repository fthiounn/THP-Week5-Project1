Rails.application.routes.draw do
  root 'static_pages#home'
  get 'dynamic_pages/home'
  get '/static_pages/home', to: 'static_pages#home'
  get '/static_pages/team', to: 'static_pages#team'
  get '/static_pages/contact', to: 'static_pages#contact'
  get '/home/:id', to: 'dynamic_pages#home'
end
