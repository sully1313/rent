class PropertiesController < ApplicationController

def index
  @properties = Property.all
  search
  render :index
end

def show
  @review = Review.find(params[:id])
  @user = User.find(params[:id])
  @property = Property.find(params[:id])
  @reviews = Property.find(params[:id]).reviews
  render :_show
end

def reviews
  @reviews = Property.find(params[:id]).reviews
  @property = Property.find(params[:id])
end
end
