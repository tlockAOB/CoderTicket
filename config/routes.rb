Rails.application.routes.draw do

  root :to => redirect("/events")

  get '/events' => 'events#index', as: :events
  get '/events/mine' => 'events#mine', as: :your_events
  get '/tickets/mine' => 'tickets#index', as: :your_tickets

  devise_for :users

  resources :events do
    resources :tickets
  end

  resources :venues

end
