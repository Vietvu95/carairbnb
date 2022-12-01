class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.availability = @availability
    if @bookmark.save
      redirect_to booking_path(@availability)
    else
      render :new
  end


  private
  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def booking_list
    @booking = Booking.find(params[:booking_id])
  end
  end
end
