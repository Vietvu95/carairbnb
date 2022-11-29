class UsersController < ApplicationController
 def index
  @cars = Car.all
end
