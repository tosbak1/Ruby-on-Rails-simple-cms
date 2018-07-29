Rails.application.routes.draw do
  #get 'homepage/index'

  #ROOT routing : This is used for home page. localhost:3000
  root 'homepage#index'

  get 'demo/index'
  get 'demo/hello'
  get 'demo/other_hello'
  get 'demo/another_hello'

  get 'homepage/runner'

  #DEFAULT routing. With this one, you do not need to provide anything else
  # get ':controller(/:action(/:id))'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
