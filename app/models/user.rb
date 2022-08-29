class User < ApplicationRecord
    has_secure_password

    validates :name, presence: :true
    validates :email, format: { with: /@/, message: "Email needs to contain an @" }, uniqueness: true
end
