Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
 namespace :client do
    get '/wineries' => 'wineries#index'
    get '/wineries/:id' => 'wineries#show'	
    get 'wineries/:id/edit' => 'wineries#edit'
    patch 'wineries/:id' => 'wineries#update'

    get 'users/:id/edit' => 'users#edit'
    get '/users/:id' => 'users#show'
    patch '/users/:id' => 'users#update'
    delete '/users/:id' => 'users#destroy'
    get '/signup' => 'users#new'
    post '/users' => 'users#create'

    get "/login" => "sessions#new"
    post "/login" => "sessions#create"
    delete "/logout" => "sessions#destroy"
    
    patch'/appointment/:id' => 'appointment#update'
    delete '/appointment/:id' => 'appointment#destroy'

  end

end
