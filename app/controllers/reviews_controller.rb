class ReviewsController < ApplicationController
  def index
    @reviews = policy_scope(Review)
  end

  def create
    @activity = Activity.find(params[:activity_id])
    @review = Review.new(review_params)
    authorize @review
    @review.activity = @activity
    if @review.save
      redirect_to activity_path(@activity)
    else
      @booking = Booking.new
      render 'activities/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
