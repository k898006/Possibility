Rails.application.routes.draw do

  scope module: :public do
    resources :posts, only: [:new, :create, :index, :show] do
      resources :players, only: [:create]
    end
  end


  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  devise_for :admin, skip: [:registrations], controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
