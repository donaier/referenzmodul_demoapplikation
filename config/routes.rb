ReferenzmodulDemoapplikation::Application.routes.draw do
  mount Kuhsaft::Engine => "/"

  root :to => "welcome#index"
end
