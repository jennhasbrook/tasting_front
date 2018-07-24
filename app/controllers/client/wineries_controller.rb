class Client::WineriesController < ApplicationController
	
	def index
		client_params = {
			search: params[:search]
		}

		@wineries = Unirest.get("http://localhost:3000/api/wineries", parameters: client_params).body

		render 'index.html.erb'

	end


  def edit
    @winery = Unirest.get("http://localhost:3000/api/wineries/#{params[:id]}").body
    render 'edit.html.erb'
    
  end


  def update
    @winery = {
      "id" => params[:id],
      "name" => params[:name],
      "region" => params[:region],
      "city" => params[:city],
      "address" => params[:address],
      "phone_number" => params[:phone_number],
      "tasting_fee" => params[:tasting_fee],
      "varietal" => params[:varietal],
      "link" => params[:link],
      "description" => params[:description],
      "appt_needed" => params[:appt_needed],
      "hours" => params[:hours]
    }

    response = Unirest.patch("http://localhost:3000/api/wineries/#{params['id']}", parameters: @winery)

    if response.code ==200
      flash[:success]="Winery updated."
      redirect_to "/client/wineries/#{winery['id']}"
    else
      @errors = response.body['errors']
      render 'edit.html.erb'
    end

  end


  def new
    @winery = {
      "name" => params[:name],
      "region" => params[:region],   
      "address" => params[:address],
      "phone_number" => params[:phone_number],
      "tasting_fee" => params[:tasting_fee],
      "description" => params[:description],
      "varietal" => params[:varietal],
      "link" => params[:link],   
      "appt_needed" => params[:appt_needed],
      "hours" => params[:hours],
      "city" => params[:city]
    }

    render 'new.html.erb'
  end


  def create
    @winery = {
      "name" => params[:name],
      "region" => params[:region],   
      "address" => params[:address],
      "phone_number" => params[:phone_number],
      "tasting_fee" => params[:tasting_fee],
      "description" => params[:description],
      "varietal" => params[:varietal],
      "link" => params[:link],   
      "appt_needed" => params[:appt_needed],
      "hours" => params[:hours],
      "city" => params[:city]
    }

    response = Unirest.post("http://localhost:3000/api/wineries", parameters: @winery)

    if response.code == 200
      flash[:success] ="Winery successfully created."
      redirect_to "/client/wineries"
    else
      @errors = response.body['errors']
      render 'new.html.erb'
    end

  end


  def show
    @winery = Unirest.get("http://localhost:3000/api/wineries/#{params[:id]}").body
    render 'show.html.erb'
  end


  def destroy
    @winery_id = params[:id]
    winery = Unirest.delete("http://localhost:3000/api/wineries/#{@winery_id}").body
    flash[:success] = "Winery was deleted."
    redirect_to "/client/wineries"
  end


end
