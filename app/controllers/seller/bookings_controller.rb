class Seller::BookingsController < Seller::BaseController
  def index
    @bookings = policy_scope(Booking.select('bookings.*')
      .joins(:activity)
      .where(activities: { seller: current_user }))
  end

  def confirmed
    @booking = Booking.find(params[:id])
    @booking.status = "accepted"
    authorize @booking
    if @booking.save
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
end
