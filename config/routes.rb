Rails.application.routes.draw do
  root 'application#root'
  resources :logs, only: [:create] do
    delete 'delete_all', on: :collection
  end
end
