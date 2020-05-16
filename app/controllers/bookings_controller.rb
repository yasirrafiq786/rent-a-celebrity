class BookingsController < ApplicationController

    def show
        @booking = Booking.find(params[:id])
    end

    def new
        @celebrity = Celebrity.find(params[:celebrity_id])
        @booking = Booking.new
    end

    def create
        @booking = Booking.new(booking_params)
        @celebrity = Celebrity.find(params[:celebrity_id])
        @booking.user = current_user
        @booking.celebrity = @celebrity
        @booking.status = 'pending'
        if @booking.save 
            redirect_to bookings_path
        else
            render 'new'
        end
    end

    def edit
        @booking = Booking.find(params[:id])
    end

    def update
      
    end

    private

    def booking_params
        params.require(:booking).permit(:start_date, :end_date, :celebrity_id, :status)
    end

end
