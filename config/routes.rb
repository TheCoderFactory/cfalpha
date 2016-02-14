Rails.application.routes.draw do
  resources :survey_forms, except: [:edit, :update]
  root 'pages#home'
  devise_for :users, controllers: { registrations: "registrations"}
  resources :posts do
    collection { post :import }
  end
  get 'sitemap.xml', :to => 'sitemap#index', :defaults => {:format => 'xml'}

  get 'blog', to: 'blog#index'
  get 'learn-to-code', to: 'pages#beginner'
  get 'coding-courses', to: 'pages#part_time'
  get 'coding-workshops-for-business-and-schools', to: 'pages#business'
  get 'coding-bootcamp', to: 'pages#fasttrack'
  get '/courses/digital-leadership', to: redirect('/coding-workshops')
  get '/learn-to-code/silicon-valley-express', to: redirect('learn-to-code')
  get '/courses/web-app-builder', to: redirect('/coding-courses/learn-web-development')
  get '/courses/part-time-courses/web-app-developer-pt', to: redirect('/coding-courses/learn-web-development')
  get '/courses/workshops/web-design-weekend-workshop', to: redirect('/learn-to-code')
  get 'fast-track', to: 'pages#fasttrack'
  get 'coding-for-schools', to: 'pages#business'
  get 'admin_booking', to: 'pages#admin_booking'
  get 'coder-factory-club', to: 'pages#coder_factory_club'
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
  resources "learn-to-code", :as => :courses, :controller => :courses, course_type_id: 1
  resources "coding-courses", :as => :courses, :controller => :courses, course_type_id: 2
  resources :courses
  resources :skills
  resources :skill_categories
  resources :course_locations
  resources :course_types
  resources :enquiries do
    member do
      get :responded_to
      get :reply_to
    end
  end
  resources :enquiry_types
  resources :profiles
  get 'admin', to: 'pages#admin'
  get 'contact', to: 'pages#contact'
  get 'settings', to: 'pages#settings'
  get 'coding-academy', to: 'pages#about'
  get 'thanks', to: 'pages#thanks'
  get 'privacy', to: 'pages#privacy'
  get 'community', to: 'pages#community'
  resources :users
end
