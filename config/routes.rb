Rails.application.routes.draw do
  

  get 'statistics/index' => 'statistics#index'

  get 'media/index' => 'media#index'

  get 'merchandise/index' => 'merchandise#index'

  get 'artbase/index'

  get 'edit/index'

  get '' => 'collections#index'

  # request in collections
  # case for batch upload
  get 'collections/b_upload' => 'collections#b_upload'
  # csae for manual upload
  get 'collections/m_upload' => 'collections#m_upload'

  post 'collections/create' => 'collections#create'

  get 'information/showbycollectionid/:id' => 'information#showbycollectionid'

  resources :collections

  #upload files 
  post 'uploadfiles_xls'=>'collections#upload_xls'
  post 'uploadfiles_pic'=>'collections#upload_pic'

  devise_for :users

  root 'menu#index'
  resources :information
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
