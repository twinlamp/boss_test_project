Rails.application.routes.draw do
  resources :locations
  get '/', to: 'locations#index', as: :root
end
