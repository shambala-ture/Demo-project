Rails.application.routes.draw do
  get 'products/show'

  get 'order_details/index'

  get 'orders/index'

  get 'addresses/index'

  devise_for :users,:controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  mount RailsAdmin::Engine => '/administrator', as: 'rails_admin'

  get 'welcome/index'

  devise_for :admins
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'
  get '/login', to: 'welcome#login'
  
  resources :products

  resources :banners

  resources :categories do 
    resources :subcategories
  end

  resources :carts

  resources :orders do
    collection do
      get 'search'
    end
  end

  # get 'orders/search', to: 'orders#search'

  # get '/payment', to: 'orders#show', as: 'payment'
  resources :addresses

  resources :charges

  get 'userwishlists/addproduct_from_wishlist', to: 'userwishlists#addproduct_from_wishlist'
 
  resources :userwishlists


 # delete 'userwishlists/remove_product_wishlist', to: 'userwishlists#remove_product_wishlist'

  # get '/userwishlists/show', to: 'userwishlists#show'
  # get '/addresses_new', to: 'addresses#new'
  post '/user_carts/apply_coupon', to: 'carts#apply_coupon'

  delete '/user_carts/remove_coupon', to: 'carts#remove_coupon'

  get '/user_carts', to: 'carts#show'
  # get '/user_carts_add', to: 'carts#increment_product_quantity'
  # get '/user_carts_remove', to: 'carts#decrement_product_quantity'
  get '/user_carts_update_product_quantity', to: 'carts#update_product_quantity'

  get '/user_carts_checkout', to: 'carts#checkout'

  delete '/user_carts/remove_product', to: 'carts#remove_product'

  get "/404", :to => "errors#not_found"

  get "/422", :to => "errors#unacceptable"

  get "/500", :to => "errors#internal_error"

  # root 'categories#show'
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