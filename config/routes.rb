Rails.application.routes.draw do
  root 'questions#index'

  resources :questions, only: [:index, :show, :new, :create, :edit, :update] do
    resources :answers, only:[:new, :create, :index]
  end
end
