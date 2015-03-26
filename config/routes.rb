Rails.application.routes.draw do
  root 'questions#index'

  resources :questions, except: [] do
    resources :answers, only:[:new, :create, :index]
  end
end
