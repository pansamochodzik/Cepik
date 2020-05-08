class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
  end

  def create
    binding.pry
    @car = Car.new(new_car_params)
    if @car.save
      redirect_to cars_path
    else
      render 'new'
    end
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to cars_path
  end

  private

  def new_car_params
    params.require(:car).permit(:name, :colour)
  end


end
