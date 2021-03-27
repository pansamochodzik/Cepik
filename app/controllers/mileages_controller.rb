class MileagesController < ApplicationController
  def new
    car = Car.find(params[:car_id])
    @distance = car.mileages.build
  end

  def create
    @distance = Mileage.new(distance_params)

    if @distance.save
      respond_to do |format|
        format.js
        format.html{ redirect_to cars_path, notice: 'Successfully added.' }
      end
    else
      render :new
    end
  end

  private

  def distance_params
    params.require(:mileage).permit(:car_id, :distance)
  end
end
