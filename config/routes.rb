Spree::Core::Engine.routes.append do
  namespace :admin do
    resources :gift_wrappings, :controller => 'gift_wrappings'#, :only => [:index, :new, :edit, :create, :update]
  end
end
