Rails.application.routes.draw do
  root "pages#home"
  devise_for :users,controllers:{sessions: "user/sessions"}
  resources :pages do
    collection do
      get 'home'
    end
  end
  mount Backend::Engine => "/backend"
end
