class CarsController < ApplicationController
  def create
    car = Car.create!(fixed_params)
    redirect_to user_path(car.user_id)
  end

  def update
    car = Car.find(params[:id])
    car.update!(fixed_params)
    redirect_to user_path(car.user_id)
  end

  private

  def car_params
    params.require(:car).permit(:gas, :maintenance, :user_id)
  end

  def fixed_params
    new_hash = {}
    car_params.each do |k, v|
      if k != 'user_id'
        new_hash[k] = ActiveModel::Type::Boolean.new.cast(v)
      elsif k == 'user_id'
        new_hash[k] = v
      end
    end
    new_hash
  end
end
