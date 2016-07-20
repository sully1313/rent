class PropertiesController < ApplicationController

def index
  @properties = Property.all
  @hash = Gmaps4rails.build_markers(@properties) do |property, marker|
      marker.lat property.latitude
      marker.lng property.longitude
      property_link = view_context.link_to property.streetaddress, property_path(property)
      marker.title property.streetaddress
      marker.infowindow "<h4><u>#{property_link}</u><h4>
                            <i>#{property.streetaddress}</i>"
    end
  render :index
end

def show
  @review = Review.find(params[:id])
  @property = Property.find(params[:id])
  @user = User.find(params[:id])
  @reviews = Property.find(params[:id]).reviews
  render :_show
end

def reviews
  @reviews = Property.find(params[:id]).reviews
  @property = Property.find(params[:id])
end

def search
  @properties = Property.all
  render :search
end



end
