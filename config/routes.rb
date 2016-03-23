Rails.application.routes.draw do
  root "pages#home"
  devise_for :users,controllers:{sessions: "user/sessions"}
  get 'pages/home'
  mount Backend::Engine => "/backend"
end
