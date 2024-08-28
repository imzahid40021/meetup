Rails.application.routes.draw do

  root 'meetup#home'

  get 'meetup/home'

  resources :users do
    collection do
      post :upload_csv
    end
  end
  resources :groups

  match '*unmatched', to: 'application#record_not_found', via: :all
end
