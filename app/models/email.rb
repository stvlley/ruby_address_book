class Email < ApplicationRecord
    has_many :people :as => :contact
end
