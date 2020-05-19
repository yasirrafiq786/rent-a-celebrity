class ReviewsController < ApplicationController

    def new
        @booking = Booking.find(params[:booking_id])
        @review = Review.new
    end

    def create
        @review = Review.new(review_params)
        @booking = Booking.find(params[:booking_id])
        @review.booking = @booking
        @review.celebrity_id = @booking.celebrity_id
        if @review.save
            redirect_to mycelebrities_path
        else
            render :new
        end
    end

    private

    def review_params
        params.require(:review).permit(:content, :rating)
    end
end
