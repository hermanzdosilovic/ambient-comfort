Rails.application.routes.draw do
  root 'application#root'
  resources :logs, only: [:create]
end
