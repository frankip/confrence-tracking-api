require 'open-uri'

class AttachRemoteImageJob < ApplicationJob

  queue_as :default

  def perform(model_instance, remote_url, file_name)
    io = URI.open(remote_url)
    model_instance.poster.attach(io: io, filename: "#{file_name}")
  end
end
