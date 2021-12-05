Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :stoplist
  post 'stoplist/upload', to: 'stoplist#upload'

end
