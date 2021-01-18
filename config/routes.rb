Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root 'vpns#index'
  get '/disconnect' ,to:'vpns#disconnect_all'
  get '/connect' ,to:'vpns#connect'
  resources :vpns
end
