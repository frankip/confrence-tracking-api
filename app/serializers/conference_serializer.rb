class ConferenceSerializer < ActiveModel::Serializer
  attributes :id, :reference_number, :ministry_in_charge, :number, :email, :city, :location, :time, :date, :image, :title, :description
  has_many :participants
end
