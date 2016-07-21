class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
    @property = Property.find_by_id(params[:property_id])
    render :index
  end

  def new
    @review = Review.new
    @property = Property.find_by_id(params[:property_id])
    render :_new
  end

  def create
    review_params = params[:review]
    review = Review.new({title: review_params[:title], text: review_params[:text]})
    if review.save
      property = Property.find(params[:property_id])
      property.reviews << review
      current_user.reviews << review
      if property.save && current_user.save
        redirect_to property_path(property.id)
      else
        redirect_to new_property_review_path
      end
    else
      redirect_to new_property_review_path
    end
  end

  def show
    @review = Review.find(params[:id])
    @property = @review.property_id
    @first_name = @review.user.first_name
    render :show
  end

  def edit
    @review = Review.find(params[:id])
    authorize! :manage, @review
    render :edit
  end

  def update
    @review = Review.find(params[:id])
    authorize! :manage, @review
    @review.update(review_params)
    redirect_to '/reviews/#{@review.id}'
  end

  def destroy
    @review = Post.find(params[:id])
    authorize! :manage, @review
    property = Property.find(params[:property_id])
    @review.destroy
    redirect_to property_path(property.id)
  end

  def upvote
    @review = Review.find(params[:id])
    @review.upvote_by current_user
    redirect_to :back
  end

  def downvote
    @review = Review.find(params[:id])
    @review.downvote_by current_user
    redirect_to :back
  end

  private

  def review_params
    params.require(:review).permit(:title, :text, :user_id, :property_id)
  end



end
