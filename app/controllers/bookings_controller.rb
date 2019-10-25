class BookingsController < ApplicationController
  def index
    if params[:name]
      @bookings = policy_scope(current_user.bookings).order(created_at: :desc)
      .joins(:activity)
        .where(activities: { name: params[:name] })
    else
      @bookings = policy_scope(current_user.bookings).order(created_at: :desc)
      .joins(:activity)
    end
  end

  def create
    @activity = Activity.find(params[:activity_id])
    @booking = Booking.new(params_booking)
    authorize @booking
    @booking.activity = @activity
    @booking.user = current_user
    @booking.total_price = params[:booking][:participants_number].to_i * @activity.price
    @activity.max_participants = @activity.max_participants - @booking.participants_number.to_i
    if @booking.save
      redirect_to bookings_path
      
    else
      @review = Review.new
      render 'activities/show'
    end
  end

  def params_booking
    params.require(:booking).permit(:user, :activity, :date, :participants_number, :status, :total_price)
  end
end
