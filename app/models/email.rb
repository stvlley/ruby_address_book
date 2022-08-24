class Email < ApplicationRecord
    has_many :peole :as => :contact
end
