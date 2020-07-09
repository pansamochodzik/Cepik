# frozen_string_literal: true

class CarsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @cars = Car.all.paginate(page: params[:page], per_page: 30)

  end

  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
    @countries = Country.alphabetically.map { |country| [country.name, country.id] }
  end

  def create
    @car = Car.new(car_params)

    if @car.save
      flash[:notice] = 'Successfully created.'
      redirect_to cars_path
    else
      @countries = Country.alphabetically.map { |country| [country.name, country.id] }
      render :new
    end
  end

  def destroy
    @car = Car.find(params[:id])

    @car.destroy
    flash[:notice] = 'Successfully deleted.'
    redirect_to cars_path
  end

  def edit
    @car = Car.find(params[:id])
    @countries = Country.alphabetically.map { |country| [country.name, country.id] }
  end

  def update
    @car = Car.find(params[:id])

    if @car.update(car_params)
      flash[:notice] = 'Successfully updated.'
      redirect_to cars_path
    else
      @countries = Country.alphabetically.map { |country| [country.name, country.id] }
      render :edit
    end
  end

  private

  def car_params
    params.require(:car).permit(
      :brand,
      :colour,
      :vin_number,
      :license_plate,
      :country_id,
      :year_of_production,
      :year_of_registration
    )
  end
end
