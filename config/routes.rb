Rails.application.routes.draw do
  resources :expenses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'expenses#index'
  get 'bar' =>'expenses#bar'
end
