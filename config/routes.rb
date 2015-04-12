Rails.application.routes.draw do
  root "locations#index"
  
  resources :locations, only: [:show] do
    resources :boards, only: [:new, :create, :show] do
      resources :threads, only: [:new, :show, :create] do
        get :delete
        resources :posts, only: [:new, :create, :edit, :update] do
          get :delete
        end
      end
    end
  end


  resources :users, only: [:new, :show, :create]

  scope controller: :sessions do
    get 'login' => :login
    post 'login' => :create
    get 'logout' => :destroy
  end

  get "admin/console" => "boards#adminform"
  post "admin/update" => "boards#adminupdate"
  patch "/boards/:board_id/threads/:id" => "threads#show"
  post "boards/:board_id/threads/:thread_id/posts/:id" => "posts#update"

end
