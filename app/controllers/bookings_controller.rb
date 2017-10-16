class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = Booking.all
  end

  def show
  end
  
  def new
    @listing = Listing.find(params[:listing_id])
    @booking = Booking.new(listing: @listing)
  end

  def edit
  end

  def create
            
    @listing = Listing.find(booking_params[:listing_id])
    # Create booking model with these values
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to @listing
    else
      redirect_to listing_path(@listing)
    end
  end

  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_booking
    @booking = Booking.find(params[:id])
  end
  
  def booking_params
    # Extract values from submitted form
    params.require(:booking).permit(:listing_id, :guest, :check_in_at, :check_out_at, :guest_count)
  end
end
