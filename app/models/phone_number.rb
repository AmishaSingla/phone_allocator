class PhoneNumber < ApplicationRecord
  RANGE = (1111111111..9999999999)
  
  validate :in_phone_range?, on: [:create, :update]
  validate :allocated?, on: [:create, :update]
  
  # Custom Validation Methods
  def in_phone_range?
    if !phone.in?(RANGE)
      errors.add(:phone, I18n.t('phone.out_of_range'))
    end
  end
  
  def allocated?
    if PhoneNumber.find_by(phone: phone)
      errors.add(:phone, I18n.t('phone.already_allocated'))
    end
  end
  
  # Class Methods
  def self.random_number
    phone = rand(RANGE)
    return random_number if PhoneNumber.find_by(phone: phone)
    phone
  end
end
