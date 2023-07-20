class ConferenceSerializer < ActiveModel::Serializer
  attributes :id, :reference_number, :ministry_in_charge, :number, :email, :location, :time, :date, :title, :description, :city, :issues, :resolutions, :recommendations
  has_many :participants

  def attributes(*args)
    data = super
    data[:attachment_ids] = instance_options[:attachment_ids]
    data
  end
end
