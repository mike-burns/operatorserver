ActionController::Routing::Routes.draw do |map|
  map.resources :registrations, :only => [:create]
  map.resource  :contact_list,  :only => [:update]
end
