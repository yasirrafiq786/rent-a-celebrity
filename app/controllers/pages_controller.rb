class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def bookings
    @bookings = Booking.all
  end

  def celebrities
    @celebrities = Celebrity.all
  end

  def confirm_booking
    @booking = Booking.find(params[:id])
    @booking.status = 'confirmed'
    @booking.update(booking_params)
    redirect_to mycelebrities_path
  end

  def reject_booking
    @booking = Booking.find(params[:id])
    @booking.status = 'rejected'
    @booking.update(booking_params)
    redirect_to mycelebrities_path
  end

  def conclude_booking
    @booking = Booking.find(params[:id])
    @booking.status = 'concluded'
    @booking.update(booking_params)
    redirect_to mycelebrities_path
  end

  private

  def booking_params
    params.permit(:status)
end
end
