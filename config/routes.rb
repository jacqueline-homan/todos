Todos::Application.routes.draw do
  root to: 'high_voltage/pages#show', id: 'home'
  resource :session, only: [:create]
  resources :todos, only: [:index, :new, :create] do
    resource :completion, only: [:create]
  end
end
