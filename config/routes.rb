Nbbang::Application.routes.draw do
  devise_for :users

  resources :expense_histories
  resources :expenses
  resources :users

  root :to => 'expenses#sum'
  match 'expenses_sum' => 'expenses#sum'  
end
