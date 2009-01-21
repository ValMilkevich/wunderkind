ActionController::Routing::Routes.draw do |map|

  map.resources :items
  map.resources :rates
  map.resources :memberships
  map.resources :groups do |g|
    g.resources :users
    g.resources :memberships
  end
  map.resources :answers
  map.resources :taggables
  map.resources :tags
  map.resources :comments
  map.resources :links
  map.resources :favorites
  map.resources :categories do |c|
    c.resources :posts do |post|
      post.resources :comments
    end
    c.resources :folders
    c.resources :items
  end
  map.resources :folders do |f|
    f.resources :posts do |p|
      p.resources :comments
    end
  end
  map.resources :statuses
  map.resources :users do |user|
    user.resources :favorites
    user.resources :groups
  end
  map.resources :posts do |post|
    post.resources :comments
    post.resources :links
    post.resources :tags
    post.resources :answers
    post.resources :rates
  end
  
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'

  map.connect '', :controller=>'posts', :action=>'index'

end
