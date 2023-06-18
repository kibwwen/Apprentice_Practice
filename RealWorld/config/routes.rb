Rails.application.routes.draw do
  scope :api do
    resources :articles, params: :slug, only: %i[index show update destroy]
    resources :articles, only: :create
  end
end
