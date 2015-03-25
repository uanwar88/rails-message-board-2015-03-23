Rails.application.routes.draw do
  root 'boards#index'
  get 'boards/new' => 'boards#new'
  post 'boards' => 'boards#create'
  get 'boards/:id' => 'boards#show', as: "board"

  get 'boards/:board_id/threads/new' => 'threads#new'
  get '/boards/:board_id/threads/:id' => 'threads#show', as: "thread"
  post 'boards/:id' => 'threads#create'
  get 'boards/:board_id/threads/:id/delete' => 'threads#delete'

  get '/boards/:board_id/threads/:thread_id/posts/new' => 'posts#new'
  post '/boards/:board_id/threads/:thread_id' => 'posts#create'
  get '/boards/:board_id/threads/:thread_id/posts/:id/delete' => 'posts#delete'
  get '/boards/:board_id/threads/:thread_id/posts/:id/edit' => 'posts#edit'
  patch '/boards/:board_id/threads/:thread_id/posts/:id' => 'posts#update'

  get 'users/new' => 'users#new'
  post 'users' => 'users#create'
  get 'users/:id' => 'users#show'
  get 'login' => 'users#login'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
end
