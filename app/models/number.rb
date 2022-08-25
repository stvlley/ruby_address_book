class Number < ApplicationRecord
    has_many :people

    validates :phone_number, presence :true
end
