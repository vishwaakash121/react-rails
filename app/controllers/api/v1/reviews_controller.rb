module Api
  module v1
    class ReviewsController < ApplicationController
      skip_before_action :verify_authenticity_token

      def index
        reviews = Review.all

        render json: AirlineSerializer.new(airlines).serializable_hash.to_json
      end

      def create
        review = Review.new(review_params)

        if review.save
          render json: AirlineSerializer.new(airlines).serializable_hash.to_json
        else
          render json: {errors: review.errors.messages }, status: 422
        end
      end

      def update
        review = Review.find(params[:id])

        if review.update(review_params)
          render json: AirlineSerializer.new(airlines).serializable_hash.to_json
        else
          render json: {errors: review.errors.messages }, status: 422
        end
      end

      def destroy
        review = Review.find(params[:id])

        if review.destroy
          head :no_content
        else
          render json: {errors: review.errors.messages }, status: 422
        end
      end

      private

      def review_params
        params.require(:review).permit(:title, :description, :scope)
      end
    end
  end
end