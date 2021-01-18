Rails.application.routes.draw do
  resources :portfolios

  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'



  resources :blogs
  
  # Root of application is now the home page
  root to: 'pages#home'
  
end
