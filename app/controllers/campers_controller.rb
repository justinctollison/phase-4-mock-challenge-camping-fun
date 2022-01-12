class CampersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

    def index
        campers = Camper.all
        render json: campers
    end

    def show
        camper = Camper.find(params[:id])
        render json: camper
    end

    def create
        camper = Camper.new(camper_params)
        if camper.save
            render json: camper, status: :created
        else
            render json: { errors: ["validation errors"] }, status: :unprocessable_entity
        end
    end

    private

    def camper_params
        params.permit(:name, :age)
    end

    def render_not_found
        render json: { error: "Camper not found." }, status: :not_found
    end

end
