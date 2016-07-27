class PropertiesController < ApplicationController

def index
  @properties = Property.all
  @hash = Gmaps4rails.build_markers(@properties) do |property, marker|
      marker.lat property.latitude
      marker.lng property.longitude
      property_link = view_context.link_to property.streetaddress, property_path(property)
      marker.title property.streetaddress
      marker.infowindow "<h4><u>#{property_link}</u><h4>
                            <i>#{property.price}</i>"
    end
  render :index
end

def show
  if current_user == nil
    flash[:error] = "Please login to view more about this property"
    redirect_to "/properties"
  else
  @property = Property.find(params[:id])
  @user = current_user
  @review = @property.reviews
  @reviews = Property.find(params[:id]).reviews
  render :show
  end
end


def reviews
  @reviews = Property.find(params[:id]).reviews
  @property = Property.find(params[:id])
end

def search
  @properties = Property.all
  render :search
end

private

def property_params
  params.require(:property).permit(:streetaddress, :city, :state, :latitude, :longitude, :img, :spec, :price, :sqft, :user_id)
end

end
