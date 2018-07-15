class Client::WineriesController < ApplicationController
	
	def index
		client_params = {
			search: params[:search]
		}

		@wineries = Unirest.get("http://localhost:3000/api/wineries", parameters: client_params).body

		render 'index.html.erb'

	end


	def show
		@winery = Unirest.get("http://localhost:3000/api/wineries/#{params[:id]}").body
		render 'show.html.erb'
	end




end
