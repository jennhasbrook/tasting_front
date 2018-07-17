Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
 namespace :client do
    get '/wineries' => 'wineries#index'
    get '/wineries/new' => 'wineries#new'
    post '/wineries' => 'wineries#create'
    get '/wineries/:id' => 'wineries#show' 
    get '/wineries/:id/edit' => 'wineries#edit'
    patch '/wineries/:id' => 'wineries#update'  
    delete '/wineries/:id' => 'wineries#destroy'

    get '/signup' => 'users#new'
    post '/users' => 'users#create'
    get '/users/:id' => 'users#show'
    get '/users/:id/edit' => 'users#edit'
    patch '/users/:id' => 'users#update'
    delete '/users/:id' => 'users#destroy'

    get "/login" => "sessions#new"
    post "/login" => "sessions#create"
    delete "/logout" => "sessions#destroy"
    
    get '/appointments' => 'appointments#index'
    get '/appointments/new' => 'appointments#new'
    post '/appointments' => 'appointments#create'
    get '/appointments/:id' => 'appointments#show' 
    get '/appointments/:id/edit' => 'appointments#edit'
    patch'/appointments/:id' => 'appointments#update'   
    delete '/appointments/:id' => 'appointments#destroy'

  end

end
