Rails.application.routes.draw do

  resources :topics
  devise_for :users
  resources :users, only:[:show, :create]
  root 'users#show'

  post :incoming, to: 'incoming#create'


end
