Rails.application.routes.draw do
  root to: 'page#index'

  scope module: "api" do
    scope module: "v1" do
      resources :sports, only: [:index] do
        resources :events, only: [:index] do
          resources :outcomes, only: [:index]
        end
      end
    end
  end
end
