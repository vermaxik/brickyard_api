Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :mains do
        put :position, on: :member
      end
    end
  end
end
