ActionController::Routing::Routes.draw do |map|
  map.resources :registrations, :only => [:create]
end
