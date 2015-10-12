Rails.application.routes.draw do
  scope module: "api" do
    scope module: "v1" do
      resources :sports, only: [:index] do
        resources :events, only: [:index] 
      end
    end
  end
end
