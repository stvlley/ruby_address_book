class Person < ApplicationRecord
    belongs_to :user
    has_many :numbers , dependent: :destroy

    validates :first_name, presence: true
    validates :last_name, presence: true

end
