class Address < ApplicationRecord
    has_many :people :as => :contact
end
