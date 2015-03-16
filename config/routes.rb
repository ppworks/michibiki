Michibiki::Engine.routes.draw do
  resources :skips, only: [:update], param: :skip_strategy
end
