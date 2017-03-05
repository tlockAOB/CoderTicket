Rails.application.routes.draw do

  root :to => redirect("/events")

  get '/events' => 'events#index', as: :events

  devise_for :users

  resources :events do
    resources :tickets
  end

end
