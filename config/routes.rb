Rails.application.routes.draw do
  get 'users/new'
  root 'static_pages#home'
  get 'static_pages/snippets'
  get 'static_pages/newsletter'
  get 'static_pages/jobs'
  get 'static_pages/videos'
  get 'static_pages/guides'
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
