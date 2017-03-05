Rails.application.routes.draw do

  root :to => redirect("/events")

  get '/events' => 'events#index', as: :events

  resources :events do
    resources :tickets
  end

end
