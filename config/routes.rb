Dancewear::Application.routes.draw do

  get "good/:id" => 'goods#show', :as => 'good'

  get 'posts' => 'posts#index'
  get 'posts/:id' => 'posts#show', :as => 'post'

  get 'goods' => 'goods#index'
  get 'goods/:section' => 'goods#index', :as => 'section_goods'
  get 'goods/:section/:category' => 'goods#index', :as => 'category_goods'

  get 'admin' => 'admin/home#index'
  namespace :admin do
    resources :sections do
      resources :categories do
        resources :goods
      end
      get 'goods' => 'goods#index'
    end
    resources :posts
    resources :static_pages
    get 'categories' => 'categories#index'
    get 'goods' => 'goods#index'
  end

  devise_for :user, :skip => [:passwords, :registrations]
  devise_scope :user do
    get '/admin/login' => 'devise/sessions#new', :as => 'new_user_session'
    delete '/admin/logout' => 'devise/sessions#destroy', :as => 'destroy_user_session'
  end
  

  # scope '/admin' do
  #   resources :sections, :as => 'admin_sections'
  # end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'main#index'

  get '/:id' => 'static_pages#show'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
