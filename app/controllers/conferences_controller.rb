class ConferencesController < ApplicationController
    def index
        render json: Conference.all
    end

    def findByReferenceNumber
        render json: Conference.find_by(reference_number: params[:reference_number])
    end
end
