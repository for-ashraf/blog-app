Rails.application.routes.draw do
  get '/', to: 'users#index'
  get '/users/:id', to: 'users#show'
  get '/posts/new', to: 'posts#new', as: 'new_post'
  get '/users/:user_id/posts', to: 'posts#index'
  get '/users/:user_id/posts/:id/new_comment', to: 'comments#new', as: 'new_comment'
  get '/users/:user_id/posts/:id', to: 'posts#show'
  post '/users/1/posts', to: 'posts#create'
  post '/users/:user_id/posts/:id', to: 'comments#create'
  post '/users/:user_id/posts/:id/like', to: 'posts#like'
end
