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
    get 'about' => 'homes#about'
    resources :stadiums, only: [:index, :show] do
      collection do
        get 'search'
      end
    end
    resources :posts, only: [:create, :show, :edit, :update, :destroy] do
      resources :comments, only: [:create, :destroy]
      resource :likes, only: [:create, :destroy]
    end
    resources :users, only: [:show, :edit, :update] do
      member do
        get :likes
      end
    end
  end

  namespace :admin do
    root to: "homes#top"
    resources :users, only: [:index, :show, :edit, :update]
    get 'users/:id/send_off' => 'users#send_off', as: 'send_off'
    patch 'users/:id/out' => 'users#out', as: 'out'
    resources :clubs, only: [:create, :index, :edit, :update, :destroy]
    resources :stadiums, only: [:create, :index, :show, :edit, :update, :destroy]
    resources :posts, only: [:index, :show, :destroy] do
      resources :comments, only: [:create, :destroy]
    end
    get 'comments' => 'comments#index', as: 'comments'
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
