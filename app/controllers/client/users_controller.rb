class Client::UsersController < ApplicationController
	
	
  def edit
  	@user = Unirest.get("http://localhost:3000/api/users/#{params[:id]}").body
  	render 'edit.html.erb'
  end


	def update
	  @user = {
	  	'id' => params[:id],
	  	'name' => params[:name],
	  	'email' => params[:email],
	  	'phone_number' => params[:phone_number]
	  }
	  response = Unirest.patch("http://localhost:3000/api/users/#{params['id']}", parameters: @user)
	
	  if response.code ==200
	 	  flash[:success] = "You successfully updated your profile."
	 		 redirect_to "/client/users/#{params['id']}"
	 	else
	 		@errors = response.body['errors']
	 		render 'edit.html.erb'
	 	end

	end


	def new
	  render 'new.html.erb'
	end


	def create
	  client_params = {
	    name: params[:name],
	    email: params[:email],
	    phone_number: params[:phone_number],
	    password: params[:password],
	    password_confirmation: params[:password_confirmation]
	    }

	  response = Unirest.post("http://localhost:3000/api/users",parameters: client_params)
	  
	  if response.code == 200
	    session[:user_id] = response.body["id"]
	    flash[:success] = 'Successfully created account!'
	    redirect_to '/client/login'
	  else
	    flash[:warning] = 'Invalid email or password!'
	 		redirect_to '/client/signup'
  	end
	end


	def show
		@user = Unirest.get("http://localhost:3000/api/users/#{params[:id]}").body
		render 'show.html.erb'
	end
	

	def destroy

		@user_id = params[:id]
		user = Unirest.delete("http://localhost:3000/api/users/#{@user_id}").body
		flash[:success] = "User was successfully deleted."
		redirect_to "/client/wineries"
	end

end
