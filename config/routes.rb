Rails.application.routes.draw do

 root 'kitties#index'    #<--- another way to establish home route. 

  get '/kitties' => 'kitties#index', as: :kitties    #list all kitties

  get '/kitties/new' => 'kitties#new', as: :new_kitty   #display a form to make a new kitty

  get '/kitties/:id' => 'kitties#show', as: :kitty  #display one kitty

  post '/kitties' => 'kitties#create'  #submit new kitty to database

  get '/kitties/:id/edit' => 'kitties#edit', as: :edit_kitty  #display a kitty to EDIT it

  patch '/kitties/:id' => 'kitties#update'  #after EDITING, u need an id when updating a kitty

  delete '/kitties/:id' => 'kitties#destroy'  #destroy kitty from database
  #^^^^^^^^^^^^^^ ---> http requests are different, allowing similar routes.
 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

      

end
