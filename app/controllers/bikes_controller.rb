class BikesController < ApplicationController
  def index
    if params[:query].present?
      @bikes = Bike.geocoded.where("address ILIKE ?", "%#{params[:query]}%")
    else
      @bikes = Bike.geocoded
    end
    @markers = @bikes.map do |bike|
      {
        lat: bike.latitude,
        lng: bike.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { bike: bike }),
        image_url: helpers.asset_url('https://moovitapp.com/images/splash-screen/local-icons/generic/Generic_Icon_Bike.png')
      }
    end
  end

  def show
    @bike = Bike.find(params[:id])
    @markers = [{ lat: @bike.latitude, lng: @bike.longitude, image_url: helpers.asset_url('https://moovitapp.com/images/splash-screen/local-icons/generic/Generic_Icon_Bike.png')}]
  end

  def new
    @bike = Bike.new
  end

  def create
    @bike = Bike.new(bike_params)
    @bike.user = current_user
    if @bike.save
      redirect_to bike_path(@bike)
    else
      render :new
    end
  end

  def edit
    @bike = Bike.find(params[:id])
  end

  def update
    @bike = Bike.find(params[:id])
    @bike.update(bike_params)
    @bike.save

    redirect_to bike_path(@bike.id)
  end

  def destroy
    @bike = Bike.find(params[:id])
    @bike.destroy
    redirect_to bikes_path(@bike.id)
  end

  private

  def bike_params
    params.require(:bike).permit(:name, :photo, :category, :price, :description, :address)
  end
end
