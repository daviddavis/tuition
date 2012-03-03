Tuition::Application.routes.draw do
  resources :enrollments

  resources :addresses

  resources :courses

  resources :payments

  resources :students

  root to: "students#index"
end
