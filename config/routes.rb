Rails.application.routes.draw do
  namespace :public do
    get 'comments/index'
    get 'comments/show'
  end
  namespace :admin do
    get 'comments/index'
    get 'comments/show'
  end
  namespace :admin do
    get 'favorite_shops/index'
    get 'favorite_shops/show'
  end
  namespace :public do
    get 'favorite_shops/index'
    get 'favorite_shops/show'
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
    get 'members/index'
    get 'members/show'
    get 'members/edit'
    post '/guests/guest_sign_in', to: 'guests#new_guest'
end


namespace :admin do
    root to: "homes#top"
    get 'members/index'
    get 'members/show'
    get 'members/edit'
    post '/guests/guest_sign_in', to: 'guests#new_guest'
  end

end
