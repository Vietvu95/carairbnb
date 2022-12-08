class BookingsController < ApplicationController

  before_action :set_car, only: %i[index show edit update create destroy new]
  def index
    @bookings = Booking.all
  end

  def show
    set_booking
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.car = @car
    if @booking.save
      redirect_to car_path(@car)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    set_booking
  end

  def update
    set_booking
    @booking.update(booking_params)
    @booking.user = current_user
    redirect_to car_booking_path(@booking.car.id), status: :see_other
  end

  def destroy
    set_booking
    @booking.destroy
    redirect_to car_bookings, status: :see_other
  end

  private

  def set_car
    @car = Car.find(params[:car_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

def booking_params
  params.require(:booking).permit(:start_date, :end_date)
end

  # def booking_list
  #   @booking = Booking.find(params[:booking_id])
  # end

end
