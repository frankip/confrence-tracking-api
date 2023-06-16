require 'base64'
require 'fileutils'

class ConferencesController < ApplicationController
    skip_before_action :authenticate, only: [:index, :show, :findByReferenceNumber, :monthly_tally]

    def index
        render json: Conference.all
    end

    def monthly_tally
        month_tally = Conference.all.map { |c| [Date.parse(c.date.split(/\s+-\s+/)[0]).strftime('%B'), Date.parse(c.date.split(/\s+-\s+/)[0]).strftime('%B')] }.flatten.tally
        months = Date::MONTHNAMES.compact.group_by { |month| month }.transform_values(&:count)
        month_init = months.each_key { |k| months[k]=0 }
        tally = month_init.merge(month_tally)
        render json: tally
    end

    def findByReferenceNumber
        render json: Conference.find_by(reference_number: params[:reference_number])
    end

    def create
        ref_number = SecureRandom.alphanumeric(10).upcase

        data = conference_params[:image].split(",")
        content_type = data[0].match(/data:(.*?);/)[1]

        image = File.join('conferences', ref_number)

        conference = Conference.create!({
            reference_number: ref_number,
            ministry_in_charge: conference_params[:ministry_in_charge],
            number: conference_params[:number],
            email: conference_params[:email],
            location: conference_params[:location],
            time: conference_params[:time],
            date: conference_params[:date],
            image: File.join("/"+image.to_s, "poster."+content_type.split("/")[-1]),
            title: conference_params[:title],
            description: conference_params[:description]
        })

        if conference
            save_image(conference.image, data[-1])
        end

        render json: conference, status: :created
    end

    def show
      conference = Conference.find(params[:id])
      render json: conference, status: :ok
    end

    def save_image(path, base64_string)

        # Decode the base64 string
        image_data = Base64.decode64(base64_string)

        filepath = Rails.root.join("public").to_s + path.to_s

        directory_path = filepath.split("/").slice(0...-1).join("/")

        FileUtils.mkdir_p(directory_path) unless File.directory?(directory_path)

        # Write the decoded data to a file
        File.open(filepath, 'wb') do |f|
            f.write image_data
        end
    end

    private

    def conference_params
        params.permit(:ministry_in_charge, :number, :email, :location, :time, :date, :image, :title, :description)
    end
end
