class Client::AppointmentsController < ApplicationController


	def index
		client_params = {
			search: params[:search]
		}

		@appointments = Unirest.get("http://localhost:3000/api/appointments", parameters: client_params).body

		render 'index.html.erb'

	end


  def edit
  	@appointment = Unirest.get("http://localhost:3000/api/appointments/#{params['id']}").body
  	render 'edit.html.erb'
  end

	def update
		@appointment = {
			'id' => params[:id],
			'winery_id' => params[:winery_id],
			'user_id' => params[:user_id],
			'appt_date' => params[:appt_date]
		}

		response = Unirest.patch("http://localhost:3000/api/appointments/#{params['id']}", parameters: @appointment)

		if response.code == 200
			flash[:success]="Appointment updated"
			redirect_to '/client/appointments'
		else
			@errors = response.body['errors']
			render 'edit.html.erb'
		end

	end

	def show
		@appointment = Unirest.get("http://localhost:3000/api/appointments/#{params[:id]}").body

		render 'show.html.erb'

	end


	def new
		@appointment = {
			"winery_id" => params[:winery_id],
			"user_id" => params[:user_id],
			"appt_date" => params[:appt_date]
		}

		render 'new.html.erb'

	end


	def create
		@appointment = {
			"winery_id" => params[:winery_id],
			"user_id" => params[:user_id],
			"appt_date" => params[:appt_date]
		}

		response = Unirest.post("http://localhost:3000/api/appointments", parameters: @appointment)

		if response.code == 200
			flash[:success]="Appointment created"
			redirect_to "/client/appointments"
		else
			@errors = response.body['errors']
			render 'new.html.erb'
		end

	end	


	def destroy
		@appointment_id = params[:id]
		@appointment = Unirest.delete("http://localhost:3000/api/appointments/#{@appointment_id}").body
		flash[:success]="Appointment deleted"
		redirect_to "/client/appointments"

	end

end
