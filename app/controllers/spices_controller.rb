class SpicesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :error_msg

    def index
        spices = Spice.all 
        render json: spices
    end

    def create
        new_spice = Spice.create(spice_params)
        render json: new_spice, status: :created
    end

    def update
        spice = Spice.find_by(id: params[:id])
        spice.update(spice_params)
        render json: spice
        
    end

    def destroy
        spice = Spice.find_by(id: params[:id])
        spice.destroy
        head :no_content
    end


    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def error_msg
        render json: { error: "Spice not found" }, status: :not_found
    end
end
