class ActivitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @activities = Activity.where.not(latitude: nil, longitude: nil)

    @markers = @activities.map do |activity|
      {
        lat: activity.latitude,
        lng: activity.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { activity: activity })
      }
    end

    if params[:location]
      @activities = policy_scope(Activity).algolia_search(params[:location])
    else
      @activities = policy_scope(Activity).order(created_at: :desc)
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


  private

  def activity_params
    params.require(:activity).permit(:name, :address, :price, :type_activity, :description, :max_participants, :location, :latitude, :longitude, :photo, :start_date, :end_date)
  end
end
