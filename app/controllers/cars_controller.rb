class CarsController < ApplicationController

  before_action :set_car, only: [:show, :edit, :update, :destroy]
  def index
    @car_images = ["car1.jpeg", "car2.jpeg", "car3.jpeg", "car4.jpeg", "car5.jpeg","car6.jpeg", "car7.webp", "car8.jpeg","car9.jpeg","car9.jpeg","car10.jpeg","car11.jpeg", "car12.jpeg", "car13.jpeg", "car14.webp","car15.jpeg"]
    @cars = Car.all
  end

  def show
    @car_image = ["car1.jpeg", "car2.jpeg", "car3.jpeg", "car4.jpeg", "car5.jpeg","car6.jpeg", "car7.webp", "car8.jpeg","car9.jpeg","car9.jpeg","car10.jpeg","car11.jpeg", "car12.jpeg", "car13.jpeg", "car14.webp","car15.jpeg"].sample
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save
      redirect_to new_car_path
    else
      render :new, status: :unprocessable_entity
    end

  end

private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:model, :make, :year, :category, :description, :price, :transmission, :colour, :availability)
  end

end
