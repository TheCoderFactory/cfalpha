Rails.application.routes.draw do

  resources :posts do
    collection { post :import }
  end
  resources :post_categories
  get 'blog', to: 'blog#index'

  get 'coder-factory-workshops-for-beginners', to: 'pages#beginner'
  get 'coder-factory-part-time-courses', to: 'pages#part_time'
  get 'coding-workshops-for-businesses', to: 'pages#business'
  get 'fast-track-intensive-bootcamp', to: 'pages#fasttrack'
  get 'coding-for-schools', to: 'pages#schools'
  resources :payments, only: [:index, :create]
  resources :feedback_forms
  resources :prequestionnaires
  resources :promo_codes
  resources :course_bookings
  resources :course_intakes
  resources :courses
  resources :skills
  resources :skill_categories
  resources :course_locations
  resources :course_types
  resources :enquiries
  resources :enquiry_types
  resources :profiles
  get 'admin', to: 'pages#admin'
  get 'contact', to: 'pages#contact'
  root 'pages#home'
  get 'settings', to: 'pages#settings'
  get 'about', to: 'pages#about'

  devise_for :users
  resources :users
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
