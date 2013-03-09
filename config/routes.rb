Twilater::Application.routes.draw do
  require 'sidekiq/web'

  match "/home" => "user#index", :as => :home

  # Omniauth routes for login/logout
  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout
  
  match "/look_for_new_tweets" => "user#look_for_new_tweets", :as => :look_for_new_tweets, :via => :get
  
  match "/search" => "user#search", :as => :search

  mount Sidekiq::Web => '/sidekiq'
  
  root :to => 'static#index'
end
