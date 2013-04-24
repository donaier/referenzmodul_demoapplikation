ReferenzmodulDemoapplikation::Application.routes.draw do
  namespace :cms do
    resources :references
  end

  mount Kuhsaft::Engine => "/"

  root :to => "welcome#index"
end
