Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :mains do
        put :position, on: :member
      end

      post :authenticate, to: 'sessions#create'
      get  'authenticate/:token_id', to: 'sessions#user_by_token'

      put :state, to: 'users#change_state'
    end
  end
end
