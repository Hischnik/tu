Rails.application.routes.draw do
  resources :railway_stations

  get 'welcome/index' # т.е. он теперь умеет отвечать на такой запрос

  root "welcome#index" # страница по умолчанию

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
