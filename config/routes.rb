Rails.application.routes.draw do
  scope module: "api" do
    scope module: "v1" do
      resources :sports, only: [:index]
    end
  end
end
