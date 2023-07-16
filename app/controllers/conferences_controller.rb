require 'base64'
require 'fileutils'
require 'net/smtp'

class ConferencesController < ApplicationController
    skip_before_action :authenticate, only: [:index, :show, :receive_message, :findByReferenceNumber, :monthly_tally, :yearly_tally, :foreign_vs_kenyan, :yearly_foreign_vs_kenyan, :monthly_foreign_vs_kenyan, :delete_conference, :update_conference]

    def send_email(sender_email, sender_password, recipient_email, subject, body)
        smtp_server = 'smtp.gmail.com'
        smtp_port = 587
        domain = 'gmail.com'
        enable_ssl = true

        message = <<~MESSAGE
            From: #{sender_email}
            To: #{recipient_email}
            Subject: #{subject}

            #{body}
        MESSAGE

        Net::SMTP.start(smtp_server, smtp_port, domain, sender_email, sender_password, :login) do |smtp|
            smtp.enable_starttls if enable_ssl
            smtp.send_message(message, sender_email, recipient_email)
        end
    end

    # ses-smtp-user.20230714-225303
    # SMTP Username:
    #     AKIAYVJFFPTEWK5FTA5U
    # SMTP Password:
    #     BDzu0Z4FdlVwYWZAgsVJU1MxrXawEAZdDh7pxb4mURWu

    def receive_message
        sender_email = 'ram.bharathbrands@gmail.com'
        sender_password = 'eccfutcatpsykoho'
        
        recipient_email = message_params[:email]
        subject = message_params[:name]
        body = "Thank you for calling me Mshenzi."

        send_email(sender_email, sender_password, recipient_email, subject, body)

        head :no_content
    end
    
    def index
        render json: Conference.all
    end

    def stats

    end

    def foreign
        data = {}
        Conference.all.map { |c| {"#{c.id}" => c.participants.map { |p| [p.id, p.nationality] } } }.map { |conf| ["#{conf.keys[0]}" => {"Foreigners" => conf.values[0].uniq.select{ |p| p[1] != "Kenyans" }.map{|pt| pt[0]}, "Kenyans" => conf.values[0].uniq.select{ |p| p[1] == "Kenyans" }.map{|pt| pt[0]} }] }.map { |conf| conf[0] }.each do |conf|
            data["#{conf.keys[0]}"] = conf.values[0]
        end
        data
    end

    def foreign_monthly
        data = {}
        Conference.all.filter { |c| Date.parse(c.date.slice(0..9)) >  Date.today.prev_year(1)  }.map { |c| { "#{Date.parse(c.date.split(/\s+-\s+/)[0]).strftime('%B')}" => c.participants.map { |p| [p.id, p.nationality] } } }.map { |conf| {"#{conf.keys[0]}" => {"Foreigners" => conf.values[0].uniq.select{ |p| p[1] != "Kenyans" }.map{|pt| pt[0]}, "Kenyans" => conf.values[0].uniq.select{ |p| p[1] == "Kenyans" }.map{|pt| pt[0]} } } }.each do |conf|
            month = "#{conf.keys[0]}"
            if data[month]
                data[month]["Foreigners"].concat(conf[month]["Foreigners"])
                data[month]["Kenyans"].concat(conf[month]["Kenyans"])
            else
                data[month] = conf[month]
            end
        end

        data
    end
        

    def foreign_vs_kenyan
        render json: foreign
    end

    def yearly_foreign_vs_kenyan
        data = {}
        foreign.each_pair do |key, value|
            year = "#{Conference.find(key.to_i).date.split("-")[0]}"
            if data[year]
                data[year]["Foreigners"].concat(value["Foreigners"])
                data[year]["Kenyans"].concat(value["Kenyans"])
            else
                data[year] = value
            end
        end

        tallys = {}

        data.each_pair do |key, value|
            tallys[key] = {"Foreigners" => value["Foreigners"].size, "Kenyans" => value["Kenyans"].size}
        end

        render json: tallys
    end

    def monthly_foreign_vs_kenyan
        tallys = {}

        foreign_monthly.each_pair do |key, value|
            tallys[key] = {"Foreigners" => value["Foreigners"].size, "Kenyans" => value["Kenyans"].size}
        end

        render json: tallys
    end

    def yearly_confs
        render json: Conference.all.map { |c| Date.parse(c.date.split(/\s+-\s+/)[0]).strftime('%Y') }.tally
    end

    def monthly_confs
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
            city: conference_params[:city],
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

    def update_conference
        conference = Conference.find_by(reference_number: params[:reference_number])
        if conference
          conference.update(conference_params)
          render json: conference
        else
          render json: {error: 'Unable to update conference'}
        end
    end

    def delete_conference
            conference = Conference.find_by(reference_number: params[:reference_number])
            if conference
              conference.destroy
              render json: { message: 'Record deleted successfully' }
            else
              render json: { error: 'Record not found' }, status: :not_found
            end
    end

    private

    def conference_params
        params.permit(:ministry_in_charge, :number, :email, :location, :city, :time, :date, :image, :title, :description, :reference_number)
    end

    def message_params
        params.permit(:name, :email, :message)
    end
end
