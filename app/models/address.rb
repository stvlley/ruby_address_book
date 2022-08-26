class Address < ApplicationRecord
  has_many :people

  validates :street, presence: true
  validates :town, presence: true
  validates :zip_code, presence: true
end
