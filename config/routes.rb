Trashmessengerbags::Application.routes.draw do
  resources :custom_fields, only: [:index, :destroy] do
    collection do
      get :edit_multiple
      put :update_multiple
    end
  end

  get "store/catalogue"
  get "store/premade"
  resources :images
  
  match '/home', to: 'home_pages#home', via: 'get'
  match '/store', to: 'store#catalogue', via: 'get'
  match '/gallery', to: 'home_pages#gallery', via: 'get'
  match '/blog', to: 'home_pages#blog', via: 'get'
  match '/locations', to: 'home_pages#locations', via: 'get'
  match '/about', to: 'home_pages#about', via: 'get'
  match '/contact', to: 'home_pages#contact', via: 'get'

  resources :custom_items
  resources :custom_item_steps

  resources :product_types
  resources :products

  resources :option_types
  resources :options
  
  resources :admins
  
  resources :sessions, only: [:new, :create, :destroy]
  match '/adminsignin', to: 'sessions#new', via: 'get'
  match '/adminsignout', to: 'sessions#destroy', via: 'delete'
  
  root 'home_pages#home'

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
