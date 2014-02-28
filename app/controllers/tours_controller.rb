class ToursController < ApplicationController
  def show
    @ambassador = User.first
    @selected_tour = Tour.find(params[:id])
  end


  def new
    @ambassador = current_user
    @specialties = Specialty.all
  end

  def create
    # @tour = Tour.new(description: params[:description], latitude: params[:latitude], longitude: params[:longitude], ambassador_id: params[:user_id])
    @tour = Tour.new(tour_params)
    @tour.ambassador_id = params[:user_id]
    respond_to do |format|
      format.json do
        if @tour.save
          render :json => {message: "SUCCESS!"}
        else
          render :json => {message: "Unable to save post"}
        end
      end
    end



    puts "THIS IS THE TOUR************ #{@tour.ambassador_id}"
  end 

  def index
  end

  private
  def tour_params
    params.require(:tour).permit(:description, :latitude, :longitude, :user_id)
  end

end