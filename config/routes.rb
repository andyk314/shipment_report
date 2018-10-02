Rails.application.routes.draw do
  resources :reports, only: %i[index create new show delete]
  resources :invoices, only: %i[index create new]
  resources :packages, only: %i[index create new]
  resources :csv, only: %i[show]
  root 'reports#index'
end
