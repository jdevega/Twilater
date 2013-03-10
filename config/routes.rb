Twilater::Application.routes.draw do
  require 'sidekiq/web'

  # Omniauth routes for login/logout
  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout
  
  match "/next_page_for/:id"  => "pages#next",    :as => :next_page_for
  match "/prev_page_for/:id"  => "pages#previous",:as => :previous_page_for
  match "/home"               => "pages#index",   :as => :home
  match "/page/:id"           => "pages#index",   :as => :pages
  match "/search"             => "pages#search",  :as => :search

  mount Sidekiq::Web => '/sidekiq'
  
  root :to => 'static#index'
end
