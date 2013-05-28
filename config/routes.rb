Zuche::Application.routes.draw do

  captcha_route

  get 'rent/new' => 'rent#new', :as => 'rent_new'

  post 'rent/comment/create/:id' => 'rent#comment_create', :as => 'rent_comment_create'

  post 'rents' => 'rent#create', :as => 'rent_create'

  get 'rents' => 'rent#index', :as => 'rents'

  get 'rent/:id' => 'rent#show', :as => 'rent'

  get 'rent_change_captcha/:id' => 'rent#change_captcha', :as => 'rent_change_captcha'

  get 'qiupin/new' => 'qiupin#new', :as => 'qiupin_new'

  post 'qiupin/comment/create/:id' => 'qiupin#comment_create', :as => 'qiupin_comment_create'

  post 'qiupins' => 'qiupin#create', :as => 'qiupin_create'

  get 'qiupins' => 'qiupin#index', :as => 'qiupins'

  get 'qiupins/filter' => 'qiupin#filter', :as => 'qiupins_filter'

  get 'qiupin/:id' => 'qiupin#show', :as => 'qiupin'

  get 'qiupin_change_captcha/:id' => 'qiupin#change_captcha', :as => 'qiupin_change_captcha'

  get 'pinche/new' => 'pinche#new', :as => 'pinche_new'

  post 'pinche/comment/create/:id' => 'pinche#comment_create', :as => 'pinche_comment_create'

  post 'pinches' => 'pinche#create', :as => 'pinche_create'

  get 'pinches' => 'pinche#index', :as => 'pinches'

  get 'pinches/filter' => 'pinche#filter', :as =>'pinches_filter'

  get 'pinche/:id' => 'pinche#show', :as => 'pinche'

  get 'pinche_change_captcha/:id' => 'pinche#change_captcha', :as => 'pinche_change_captcha'

  get 'center/pinches' => 'center#my_pinches_list', :as => 'my_pinches_list'

  get 'center/qiupins' => 'center#my_qiupins_list', :as => 'my_qiupins_list'

  get 'center/rents' => 'center#my_rents_list', :as => 'my_rents_list'

  get 'center/change_password' => 'center#change_password', :as => 'my_password'

  get 'home' => 'home#index'

  get 'contact_me' => 'home#contact_me', :as => 'contact_me'

  get 'service' => 'home#service', :as => 'service'

  get 'agreement' => 'home#agreement', :as => 'agreement'
  root :to => 'home#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users
  ActiveAdmin.routes(self)

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action
  # Sample of named
  #
  # route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)


  #namespace :admin do
  #  get 'main/index'
  #  root :to => "main#index"
  #end
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
  # match ':controller(/:action(/:id))(.:format)'
end
