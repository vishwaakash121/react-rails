module Api
  module V1
    class AirlinesController < ApplicationController
      skip_before_action :verify_authenticity_token

      def index
        airlines = Airline.all
        
        render json: AirlineSerializer.new(airlines).serializable_hash.to_json
      end

      def show
        byebug
        airline = Airline.find_by_slug(params[:slug])

        render json: AirlineSerializer.new(airline).serializable_hash.to_json
      end

      def create
        airline = Airline.new(airline_params)

        if airline.save
          render json: AirlineSerializer.new(airline).serializable_hash.to_json
        else
          render json: {errors: airline.errors.messages }, status: 422
        end
      end

      def update
        airline = Airline.find_by_slug(params[:slug])

        if airline.update(airline_params)
          render json: AirlineSerializer.new(airlines, options).serializable_hash.to_json
        else
          render json: {errors: airline.errors.messages }, status: 422
        end
      end

      def destroy
        byebug
        airline = Airline.find_by_slug(params[:slug])

        if airline.destroy
          head :no_content
        else
          render json: {errors: airline.errors.messages }, status: 422
        end
      end

      private

      def airline_params
        params.require(:airline).permit(:name, :image_url, :slug)
      end
    end
  end
end