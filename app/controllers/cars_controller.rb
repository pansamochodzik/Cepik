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
    @car = Car.new(car_params)
    if @car.save
      flash[:notice] = "Successfully created."
      redirect_to cars_path
    else
      render :new
    end
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    flash[:notice]= "Successfully deleted."
    redirect_to cars_path
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])
    if @car.update(car_params)
      flash[:notice]= "Successfully updated."
      redirect_to cars_path
    else
      render :edit
    end
  end

  private

  def car_params
    params.require(:car).permit(:name, :colour)
  end

end
