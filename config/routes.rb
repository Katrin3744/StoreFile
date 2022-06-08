Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'text_files#index'
  resources :text_files do
    get 'download_file', to: 'text_files#download_file', as: 'download', on: :member
  end
  get 'results', to: 'results#index', as: 'results'
end
