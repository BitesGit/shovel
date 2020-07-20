Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :spades
  get '/spades_wizard/new' => 'spades#new_wizard', as: :new_wizard
  post '/spades_wizard/new' => 'spades#new_wizard_save', as: :new_wizard_save
  get '/spades/:id/wizard/:step' => 'spades#wizard_step', as: :wizard_step
  patch '/spades/:id/wizard/:step' => 'spades#wizard_save', as: :wizard_step_save

  get '/logic/:this/then/:that' => 'logic#if_this_then_that', as: :if_this_then_that

  root to: 'spades#index'
end
