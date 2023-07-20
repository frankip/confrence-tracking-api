class Conference < ApplicationRecord
    has_many :participations
    has_many :participants, through: :participations

    has_many_attached :files
    has_one_attached :poster
end
