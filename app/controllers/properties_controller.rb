class PropertiesController < ApplicationController

  def index
    @properties = Property.all
    @markers = @properties.geocoded.map do |property|
      {
        lat: property.latitude,
        lng: property.longitude
      }
    end
  end
    
  def show
    @property = Property.find(params[:id])
  end

  def new
    @property = Property.new
  end
    
  def create
    @property = Property.new(property_params)
    @property .user = current_user
    @property.save!
    redirect_to properties_path(@property)
  end

  def edit
    @property = Property.find(params[:id])
  end

  def update
    @property = Property.find(params[:id])
    @property.update(property_params)
    redirect_to properties_path(@property)
  end

  def destroy
    @property = Property.find(params[:id])
    @property.destroy
 
    redirect_to properties_path(@property)
  end

  private

  def property_params
    params.require(:property).permit(:address, :size, :year, :rooms, :price, :state, :type_of_property, photos: [])
  end

end
