Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :stoplist
  post 'stoplist/upload', to: 'stoplist#upload'

  namespace 'api' do
    namespace 'v1' do
      post 'phone/check', to: 'phone#check'
    end
  end

end
