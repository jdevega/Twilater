Twilater::Application.routes.draw do
  require 'sidekiq/web'

  # Omniauth routes for login/logout
  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout
  
  match "/home"               => "pages#index",   :as => :home
  match "/page/:id"           => "pages#index",   :as => :page
  match "/search"             => "pages#search",  :as => :search
  match "/page/:id/read"      => "pages#read",    :as => :read_page
  match "/page/:id/delete"    => "pages#delete",  :as => :delete_page

  match "/look_for_new_pages"   => "user#look_for_new_pages"
  match "/look_for_new_tweets"  => "user#look_for_new_tweets"

  mount Sidekiq::Web => '/sidekiq'
  
  root :to => 'static#index'
end
