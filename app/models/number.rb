class Number < ApplicationRecord
    has_many :people :as => :contact
end
