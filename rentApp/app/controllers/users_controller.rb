class UsersController < ApplicationController
  before_action only: [:show, :edit, :update, :destroy]

  def index
    search
    render :index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Hello, #{@user.first_name}! Welcome to Rent13!"
      login(@user)
      redirect_to '/'
    else
      flash[:error] = @user.errors.full_messages.join("----")
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews
    render :show
  end

  def edit
    @user = User.find(params[:id])
    render :edit
  end

  def update
    @user = User.find(params[:id])
    if current_user == @user
      @user.update_attributes(user_params)
      if @user.save
        redirect_to '/users/#{@user.id}'
      else
        redirect_to '/users/#{@user.id}/edit'
      end
    end
  end

  def reviews
    @reviews = User.find(params[:id]).reviews
  end
  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :hometown, :password, :description, :sociallink)
  end

end
