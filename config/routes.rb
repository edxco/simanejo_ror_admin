Rails.application.routes.draw do
  get 'students/new'
  get 'students/create'
  get 'static/home'
  get '/search_students', to: 'students#searching'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'static/home';

  root to: 'static#home'

  get 'register', to: 'users#new'
  resources :users, except: [:new]

  resources :courses
  resources :students
  resources :appointments do
    get 'pdf', to: 'appointments#pdf', as: :pdf, on: :member
  end
  resources :instructors

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
