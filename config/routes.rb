ReferenzmodulDemoapplikation::Application.routes.draw do
  namespace :cms do
    resources :references do
      resources :reference_assets
    end
    resources :reference_topic_categories, :only => [:index, :create, :destroy] do
      resources :reference_topics, :except => [:show, :index]
    end
    resources :reference_branches, :except => :show
    resources :reference_services, :except => :show
  end

  mount Kuhsaft::Engine => "/"

  root :to => "welcome#index"
end
