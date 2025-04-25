Rails.application.routes.draw do
  root to: "projects#index"

  resources :projects do
    resources :tasks
  end

  resources :tasks do
    scope module: :tasks do
      resource :name, only: [:edit, :update]
    end
  end
end

