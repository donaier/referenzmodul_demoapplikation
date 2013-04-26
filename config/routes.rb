ReferenzmodulDemoapplikation::Application.routes.draw do
  namespace :cms do
    resources :references do
      resources :reference_assets
    end
    resources :reference_branches, :except => :show
  end

  mount Kuhsaft::Engine => "/"

  root :to => "welcome#index"
end
