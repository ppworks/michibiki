Rails.application.routes.draw do
  resource :profile, only: %i(edit)
  root 'pages#index'
  mount Michibiki::Engine => "/michibiki"
end
