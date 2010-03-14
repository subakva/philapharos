ActionController::Routing::Routes.draw do |map|
  map.resources :lighthouse_accounts do |a|
    a.resources :lighthouse_projects
  end
  map.root :controller => "lighthouse_accounts"
end
