Rails.application.routes.draw do

  get 'chefs/index'

	root 'pages#home'
  	get '/home', to: 'pages#home'

  	# create route recipes manually
  	# get '/recipes', to: 'recipes#index'
  	# get '/recipes/new', to: 'recipes#new', as: 'new_recipe'
  	# post '/recipes', to: 'recipes#create'
  	# get '/recipes/:id/edit', to: 'recipes#edit', as: 'edit_recipe'
  	# patch '/recipes/:id', to: 'recipes#update'
  	# get '/recipes/:id', to: 'recipes#show'
  	# delete '/recipes/:id', to: 'recipes#destroy'

  	# create route recipes in short
  	resources :recipes do
      member do
        post 'like'
      end 
    end

    resources :chefs, except: [:new]

    get '/register', to: 'chefs#new'
  
end
