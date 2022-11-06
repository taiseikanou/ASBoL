Rails.application.routes.draw do
devise_for :members, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}


devise_for :admin, controllers: {
  sessions: "admin/sessions"
}
scope module: :public do
    root to: "homes#top"
end

end
