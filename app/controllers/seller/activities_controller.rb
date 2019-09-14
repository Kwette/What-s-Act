class Seller::ActivitiesController < Seller::BaseController
  def index
    @activities = policy_scope(current_user.activities)

    @markers = @activities.map do |activity|
      {
        lat: activity.latitude,
        lng: activity.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { activity: activity })
      }
    end
  end

  def new
    @activity = Activity.new
    authorize @activity
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.seller = current_user
    authorize @activity
    if @activity.save
      redirect_to seller_activity_path(@activity)
    else
      render :new
    end
  end

  def show
    @activity = Activity.find(params[:id])
    authorize @activity
    @booking = Booking.new
    @review = Review.new
  end


  def destroy
    @activity = Activity.find(params[:id])
    authorize @activity
    @activity.destroy
    redirect_to seller_activities_path
  end

  private


  def activity_params
    params.require(:activity).permit(:name, :address, :price, :type_activity, :description, :max_participants, :location, :latitude, :longitude, :photo, :start_date, :end_date)
  end

end
