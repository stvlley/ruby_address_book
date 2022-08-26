class Email < ApplicationRecord
    has_many :people

    validates :email_address, presence: true

end
