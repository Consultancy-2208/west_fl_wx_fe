class CarsController < ApplicationController
  def create
  end

  def update
    car = Car.find(params[:id])
    car.update!(fixed_params)
    redirect_to user_path(car.user_id)
  end

  private

  def car_params
    params.require(:car).permit(:gas, :maintenance)
  end

  def fixed_params
    new_hash = Hash.new
    car_params.each do |k, v|
      if v == '1'
        new_hash[k] = true
      elsif v == '0'
        new_hash[k] = false
      end
    end
    new_hash
  end
end