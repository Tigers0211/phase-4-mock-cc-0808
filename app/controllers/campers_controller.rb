class CampersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    rescue_from ActiveRecord::RecordInvalid, with: :show_errors

    def index
        camper = Camper.all
        render json: camper.to_json(except: [:activities, :created_at, :updated_at]), status: :ok
      end
  
      def show
          camper = Camper.find(params[:id])
          render json: camper, status: :ok
          
      end

      def create
        camper = Camper.create!(camper_params)
        render json: camper.to_json(except: [:activities]), status: 201
     
       
    end

      private

      def not_found
          render json: {error: "Camper not found"}, status: :not_found
      end

      def camper_params
        params.permit(:name, :age)
      end

      def show_errors
        render json: {error: e.record.errors.full_messages}, status: :unprocessable_entity

      end
  
end
