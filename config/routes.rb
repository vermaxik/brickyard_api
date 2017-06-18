Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :mains#, path: :states, as: :states
    end
  end
end
