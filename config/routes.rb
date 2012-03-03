Tuition::Application.routes.draw do
  resources :addresses

  resources :courses

  resources :payments

  resources :students

  root "students#index"
end
