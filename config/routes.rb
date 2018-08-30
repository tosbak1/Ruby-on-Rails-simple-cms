Rails.application.routes.draw do


    #ROOT routing : This is used for home page. localhost:3000
    root 'homepage#index'

=begin
  #Going to transform these Simple Routes to Resourceful Routes or REST routes
  get 'subjects/index'
  get 'subjects/show'
  get 'subjects/new'
  get 'subjects/edit'
  get 'subjects/delete'
=end
  #get 'homepage/index'

  #This is Resourceful Routes for the Subjects_controller that has all the defaults
  #but since default does not come with delete we will add a code block for delete
  resources :subjects do
    member do
      get :delete
    end
  end
  resources :pages do
    member do
      get :delete
    end
  end
  resources :sections do
    member do
      get :delete
    end
  end


  get 'demo/index'
  get 'demo/hello'
  get 'demo/other_hello'
  get 'demo/another_hello'
  get 'demo/escaped_output'

  get 'homepage/runner'

  #DEFAULT routing. With this one, you do not need to provide anything else
  # get ':controller(/:action(/:id))'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
