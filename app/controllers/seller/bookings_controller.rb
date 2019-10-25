class Seller::BookingsController < Seller::BaseController
  def index

    if params[:name]
      @bookings = policy_scope(Booking.select('bookings.*').order(created_at: :desc)
      .joins(:activity)
      .where(activities: { seller: current_user })
      .where(activities: { name: params[:name] }))
    else
      @bookings = policy_scope(Booking.select('bookings.*').order(created_at: :desc)
      .joins(:activity)
      .where(activities: { seller: current_user }))
    end
  end

  def confirmed
    @booking = Booking.find(params[:id])
    @activity = @booking.activity
    @booking.status = "accepted"
    authorize @booking

    if @booking.save
      @booking.activity.max_participants = @booking.activity.max_participants.to_i - @booking.participants_number.to_i
      redirect_to seller_bookings_path
    end
  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.status = "declined"
    authorize @booking
    if @booking.save
      redirect_to seller_bookings_path
    end
  end

  def params_booking
    params.require(:booking).permit(:user, :activity, :date, :participants_number, :status, :total_price)
  end
end
