class PropertiesController < ApplicationController

def index
  @properties = Property.all
  @hash = Gmaps4rails.build_markers(@properties) do |property, marker|
      marker.lat property.latitude
      marker.lng property.longitude
      marker.infowindow property.review
    end
  render :index
end

def show
  @properties = Property.all
  @user = User.find(params[:id])
  render :_show
end


end
