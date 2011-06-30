Saas::Application.routes.draw do
  resources :account_categories

  match 'timesheets/:y/:m', :to => 'timesheets#index', :constraints => { :y => /\d{4}/, :m => /[01]?\d/, :d => /[0-3]?\d/ },:as => :timesheets_month, :via => :get
  match 'timesheets/:y/:m', :to => 'timesheets#bulk_create', :constraints => { :y => /\d{4}/, :m => /[01]?\d/, :d => /[0-3]?\d/ },:as => :timesheets_month, :via => :post
  match 'timesheets/new/:y/:m/:d', :to => 'timesheets#new', :constraints => { :y => /\d{4}/, :m => /[01]?\d/, :d => /[0-3]?\d/ }, :as => :new_timesheet_day, :via => :get

  resources :timesheets

  resources :users do
    collection do
      delete :destroy_selected
    end
  end
  resources :accounts do
    collection do
      delete :destroy_selected
    end
  end

  devise_for :users, :path_names => { :sign_up => "signup", :sign_in => "login" , :sign_out => "logout" }, :controllers => { :sessions => 'sessions', :passwords => 'passwords', :registrations => 'registrations' }, :path_prefix => 'd'
    
  root :to => 'pages#home'
  match 'documentation', :to => 'pages#documentation'

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

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
