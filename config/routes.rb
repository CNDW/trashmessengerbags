Trashmessengerbags::Application.routes.draw do
  resources :images, only: [:index, :new, :create, :destroy]
  
  match '/home', to: 'home_pages#home', via: 'get'
  get "home_pages/store"
  get "home_pages/custom"
  get "home_pages/gallery"
  match '/blog', to: 'home_pages#blog', via: 'get'
  get "home_pages/locations"
  match '/about', to: 'home_pages#about', via: 'get'
  get "home_pages/contact"
  resources :product_options

  resources :custom_items 

  resources :product_categories
  
  resources :admins
  
  resources :sessions, only: [:new, :create, :destroy]
  match '/adminsignin', to: 'sessions#new', via: 'get'
  match '/adminsignout', to: 'sessions#destroy', via: 'delete'
  
  resources :users

  resources :products
  
  root 'custom_items#index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
