class BookingsController < ApplicationController

  before_action :set_car, only: %i[show create destroy new]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.car = @car
    @booking.save
    redirect_to car_path(@car)
  end

  def destroy
  end


  private

  def set_car
    @car = Car.find(params[:car_id])
  end

def booking_params
  params.require(:booking).permit(:start_date, :end_date)
end

  # def booking_list
  #   @booking = Booking.find(params[:booking_id])
  # end

end
