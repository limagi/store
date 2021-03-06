Rails.application.routes.draw do

  namespace :admin do
    resources :articles
  end
  # This line mounts Spree's routes at the root of your application.
  # This means, any requests to URLs such as /products, will go to Spree::ProductsController.
  # If you would like to change where this engine is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Spree relies on it being the default of "spree"
  mount Spree::Core::Engine, at: '/'
          # The priority is based upon order of creation: first created -> highest priority.
  #
  # Spree::Core::Engine.routes.prepend do
  #   get '/about_us', :to => 'static_pages#about', as: :about_us
  #   get '/delivery', :to => 'static_pages#delivery', as: :delivery
  #   get '/contacts', :to => 'static_pages#contacts', as: :contacts
  #   get '/price', :to => 'price#index', as: :price
  # end

  Spree::Core::Engine.routes.append do
    # match 'some-path' => 'some-controller#show', :as => :some_routename
    # get '/other-path' => 'other-controller#new', :as => :other_routename
    post '/ajax/order_items', :to => 'ajax#order_items'
    post '/ajax/update_item', :to => 'ajax#update'
    post '/ajax/add_item', :to => 'ajax#populate'

    get '/about_us', :to => 'static_pages#about'
    get '/delivery', :to => 'static_pages#delivery'
    get '/contacts', :to => 'static_pages#contacts'
    get '/how_we_work', :to => 'static_pages#how_we_work'
    get '/delivery', :to => 'static_pages#delivery'
    get '/pickup', :to => 'static_pages#pickup'
    get '/vacancies', :to => 'static_pages#vacancies'
    get '/brands', :to => 'static_pages#brands'
    get '/catalogs', :to => 'static_pages#catalogs'
    get '/certificates', :to => 'static_pages#certificates'
    get '/price', :to => 'price#index'
    get '/articles', :to => 'articles#index'
    get '/articles/:id', :to => 'articles#show'
    get '/promotions', :to => 'promotions#index'
    get '/promotions/:id', :to => 'promotions#show'
  end

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
  #     resources :comments, :promotions
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :promotions do
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
