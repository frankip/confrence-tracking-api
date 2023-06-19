class Conference < ApplicationRecord
    has_many :participations
    has_many :participants, through: :participations
end
