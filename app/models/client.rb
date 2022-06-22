class Client < ApplicationRecord
  validates :name, presence: true
  validates :phone_number, presence: true,
                           numericality: true,
                           length: { is: 10 }
end
