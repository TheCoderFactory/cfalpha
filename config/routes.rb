Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users, controllers: { registrations: "registrations"}
  resources :posts do
    collection { post :import }
  end
  get 'sitemap.xml', :to => 'sitemap#index', :defaults => {:format => 'xml'}

  get 'blog', to: 'blog#index'
  get 'coder-factory-workshops-for-beginners', to: 'pages#beginner'
  get 'coder-factory-part-time-courses', to: 'pages#part_time'
  get 'coding-workshops-for-businesses', to: 'pages#business'
  get 'fast-track-intensive-bootcamp', to: 'pages#fasttrack'
  get 'fast-track', to: 'pages#fasttrack'
  get 'coding-for-schools', to: 'pages#business'
  get 'admin_booking', to: 'pages#admin_booking'
  resources :payments, only: [:index, :create] do 
    collection do
      get :choose
    end
  end
  resources :post_categories
  resources :feedback_forms, except: [:edit, :update, :destroy]
  resources :prequestionnaires, except: [:edit, :update, :destroy]
  resources :promo_codes do
    member do
      get :apply
    end
  end
  resources :course_bookings do
    collection do
      get :confirm
    end
  end
  resources :course_intakes
  resources :courses
  resources :skills
  resources :skill_categories
  resources :course_locations
  resources :course_types
  resources :enquiries, except: [:edit, :update] do
    member do
      get :responded_to
    end
  end
  resources :enquiry_types
  resources :profiles
  get 'admin', to: 'pages#admin'
  get 'contact', to: 'pages#contact'
  get 'settings', to: 'pages#settings'
  get 'about', to: 'pages#about'
  get 'thanks', to: 'pages#thanks'
  get 'privacy', to: 'pages#privacy'
  get 'community', to: 'pages#community'
  resources :users
end
