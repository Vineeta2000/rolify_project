Rails.application.routes.draw do
 
  devise_for :users 
  resources :posts do 
    collection do 
      post :create_comment
      post :like_dislike
      delete :like_dislike
      delete :destroy_comment
    end
  end

  root 'homes#index'
  get 'homes/index'

 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
