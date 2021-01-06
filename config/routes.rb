Rails.application.routes.draw do
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "clearance/users", only: [] do
    resource :password,
      controller: "clearance/passwords",
      only: [:edit, :update]
  end

  resources :users, only: [:create] # to override clearance route

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"

  constraints Clearance::Constraints::SignedIn.new { |user| user.admin? } do
    root to: "posts#index", as: :admin_root
  end

  constraints Clearance::Constraints::SignedIn.new do
    root to: "posts#index", as: :signed_in_root
  end

  constraints Clearance::Constraints::SignedOut.new do
    root to: "pages#welcome"
  end

  resources :crews, path: '', only: [] do
    resources :posts, only: :index

    resources :users, path: '', only: [] do
      resources :posts do
        member do
          post :go_live
          post :archive
        end
        resources :comments, only: [:create, :destroy]
      end
    end
  end

  resources :images, only: [] do
    collection do
      post :search_unsplash
    end
  end
end
