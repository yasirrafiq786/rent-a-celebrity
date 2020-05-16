class BookingsController < ApplicationController
#    after_action :set_total_price, only: :create

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
        @booking = Booking.find(params[:id])
        @booking.update(booking_params)
    end

    # def set_total_price
    #     raise
    #     @booking = Booking.find(params[:id])
    #     days = @booking.end_date - @booking.start_date
    #     total_price = @booking.celebrity.price_per_day * days.to_i
    #     @booking.total_price = total_price
    # end

    private

    def booking_params
        params.require(:booking).permit(:start_date, :end_date, :celebrity_id, :status)
    end

end
