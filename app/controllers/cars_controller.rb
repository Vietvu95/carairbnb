class CarsController < ApplicationController

  before_action :set_car, only: [:show, :edit, :update, :destroy]
  def index
    @cars = Car.all
  end

  def show
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save
    redirect_to cars_path
    else
      render :new, status: :unprocessable_entity
    end
  end

private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:model, :make, :year, :category, :description, :price, :tranmission, :color)
  end

end
