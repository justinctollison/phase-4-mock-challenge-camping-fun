class SignupsController < ApplicationController

    def create
        signup = Signup.new(signups_params)
        if signup.save
            render json: signup.activity, status: :created
        else
            render json: { errors: ["validation errors"] }, status: :unprocessable_entity
        end
    end

    private

    def signups_params
        params.permit(:time, :camper_id, :activity_id)
    end

end
