Rails.application.routes.draw do

  namespace :public do
    get 'comments/index'
    get 'comments/show'
  end
  namespace :admin do
    get 'comments/index'
    get 'comments/show'
  end
devise_for :members, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}


devise_for :admin, controllers: {
  sessions: "admin/sessions"
}
scope module: :public do
    root to: "homes#top"
    post '/guests/guest_sign_in', to: 'guests#new_guest'
    resource :members,only:[:show,:update,:create,:edit,:index]
    resources :posts, only: [:index,:show,:update,:create,:edit,:new]do
     resources :post_comments, only: [:create]
   end
end



namespace :admin do
    root to: "homes#top"
    resources :members,only:[:index,:show,:update,:create]
    post '/guests/guest_sign_in', to: 'guests#new_guest'
  end

end
