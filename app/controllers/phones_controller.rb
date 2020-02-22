class PhonesController < ApplicationController
  def create
    phone = if create_params[:phone]
              PhoneNumber.new(create_params)
            else
              PhoneNumber.new(phone: PhoneNumber.random_number)
            end
    if phone.save
      render json: phone.as_json(only: :phone)
    else
      render json: phone.errors, status: 400
    end
  end
  
  def index
    phones = PhoneNumber.all
    render json: phones.as_json(only: :phone)
  end
  
  private
  
  def create_params
    params.permit(:phone)
  end
end
