ReferenzmodulDemoapplikation::Application.routes.draw do
  namespace :cms do
    resources :references do
      resources :reference_assets
    end
  end

  mount Kuhsaft::Engine => "/"

  root :to => "welcome#index"
end
