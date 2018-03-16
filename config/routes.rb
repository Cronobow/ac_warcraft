Rails.application.routes.draw do
  namespace :admin do
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "missions#index"

  resources :invitations, only: [:show] do
    member do
      post :accept
      post :decline
      post :cancel
    end
  end
  resources :instances, only: [:index, :show] do
    member do
      post :submit
      #任務完成，提交答案
      post :abort
      #放棄任務
    end
  end

  resources :missions, only: [:index, :show] do
    member do
      post :challenge
      # POST challenge_mission_path 挑戰本任務
    end
  end

  resources :users do
    member do
      post :invite
    end
  end

  namespace :admin do
    root "missions#index"
    resources :missions
  end

end
