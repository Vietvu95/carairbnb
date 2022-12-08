class BookingsController < ApplicationController

  # before_action :set_car, only: %i[show create destroy new]

  def new
    @booking = Booking.new
  end

  def show
    @booking = Booking.find(params[:id])
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
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to car_path(@booking.car.id), status: :see_other
  end

  def destroy
  end


  private

  # def set_car
  #   @car = Car.find(params[:car_id])
  # end

def booking_params
  params.require(:booking).permit(:start_date, :end_date, :status)
end

end
