Neurotelcal::Application.routes.draw do
  resources :tools do 
    get 'new_import_cdr', :on => :collection
    post 'create_import_cdr', :on => :collection
  end
  
  resources :entities

  resources :message_calendars

  get "page/about"

  get "reports/index"
  get "reports/export_csv_index"
  post "reports/export_with_format"
  get "reports/export"

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :users

  get 'plivos/report'
  resources :plivos do
    member do
      get 'call_client'
      post 'docall_client'
      post 'answer_client', :defaults => { :format => 'xml' }
      post 'hangup_client', :defaults => { :format => 'xml' }
      post 'ringing_client', :defaults => { :format => 'xml' }
      post 'get_digits_client', :defaults => { :format => 'xml' }
    end
  end

  resources :groups

  resources :clients do
    get 'new_upload_massive', :on => :collection
    post 'create_upload_massive', :on => :collection
  end

  resources :messages

  resources :resources

  resources :campaigns

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
  # root :to => 'welcome#index'
  root :to => 'campaigns#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
