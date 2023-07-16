class ConferenceSerializer < ActiveModel::Serializer
  attributes :id, :reference_number, :ministry_in_charge, :number, :email, :location, :time, :date, :image, :title, :description, :city, :issues, :resolutions, :recommendations
  has_many :participants
end
