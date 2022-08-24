class Person < ApplicationRecord
    belongs_to :contact, :polymorphic => true
end
