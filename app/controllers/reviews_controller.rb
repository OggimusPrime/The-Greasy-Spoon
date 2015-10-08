class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_review, only: [:edit, :update, :destroy]
  before_action :check_user, only: [:edit, :update, :destroy]
  before_action :set_restaurant

  def new
    @review = Review.new
  end

  def edit
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.restaurant_id = @restaurant.id

    respond_to do |format|
      if @review.save
        format.html do
          redirect_to @restaurant, notice: 'Review was successfully created.'
        end
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json do
          render json: @review.errors, status: :unprocessable_entity
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html do
          redirect_to restaurant_path(@restaurant),
                      notice: 'Review was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json do
          render json: @review.errors, status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    @review.destroy
    respond_to do |format|
      format.html do
        redirect_to restaurant_path(@restaurant),
                    notice: 'Review was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment)
  end

  def check_user
    return if (@review.user == current_user) || (current_user.admin?)
    redirect_to root_url, alert: 'Sorry, this review belongs to someone else'
  end
end
