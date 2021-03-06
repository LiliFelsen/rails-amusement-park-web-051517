class AttractionsController < ApplicationController
  before_action :current_user

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def ride
    @attraction = Attraction.find(params[:id])
    @ride = Ride.create(attraction_id: @attraction.id, user_id: current_user.id)
    flash[:notice] = @ride.take_ride
    redirect_to user_path(current_user)
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attraction_params)
    @attraction.save
    redirect_to attraction_path(@attraction)
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :tickets, :nausea_rating, :happiness_rating)
  end


end
