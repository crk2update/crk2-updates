Rails.application.routes.draw do
  resources :family_years
  resources :children
  resources :guardians
  resources :families
  resources :communities
  resources :enrollments
  resources :sponsorships
  resources :sponsors
  resources :clothes
  
  root 'welcome#index'
  match 'login' => 'welcome#login', :via => [:get, :post]
  match 'logout' => 'welcome#logout', :via => [:get, :post]
  get 'impressum' => 'welcome#impressum'
  get 'communities/:id/next_code' => 'communities#next_code'
  get 'reports/daily_report' => 'reports#daily_report'
  get 'children/:id/quick_edit_read' => 'children#quick_edit_read'
  post 'children/:id/quick_edit_update' => 'children#quick_edit_update'
  
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
