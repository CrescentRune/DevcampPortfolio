Rails.application.routes.draw do
  resources :portfolios, except: [:show, :index]
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  get 'portfolios/(:subtitle)', to: 'portfolios#index'

  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'



  resources :blogs do 
    member do
      get :toggle_status
    end
  end
  
  # Root of application is now the home page
  root to: 'pages#home'
  
end
