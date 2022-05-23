Rails.application.routes.draw do

   devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  devise_for :admin, skip: [:registrations], controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do
    root to:"homes#top"
    resources :posts, only: [:create, :index, :show, :edit, :update, :destroy]
    resources :users, only: [:index, :show, :edit, :update]
  end

  namespace :admin do
    root to: "homes#top"
    resources :users, only: [:index, :show, :edit, :update]
    get 'users/:id/send_off' => 'users#send_off', as: 'send_off'
    patch 'users/:id/out' => 'users#out', as: 'out'
    resources :clubs, only: [:new, :create, :index, :show, :edit, :update, :destroy]
    resources :stadiums, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
