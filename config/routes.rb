Rails.application.routes.draw do
  get 'posts/index'
 get '/mypost/:user_id', to:'posts#mypost'
  devise_for :users
  root 'posts#index'
post "mycomments/:comment_id" =>"comments#mycomment" ,as: "mycomment"
 
  resources :posts do
    resources :comments
  end
  resources :comments do
   resources :comments
  end
end
