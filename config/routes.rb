Todos::Application.routes.draw do
  root to: 'high_voltage/pages#show', id: 'home'
  resource :session, only: [:create]
end
