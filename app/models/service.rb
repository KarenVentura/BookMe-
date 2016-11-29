class Service < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :appointments
end
