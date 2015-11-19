class ReservationsController < ApplicationController
	before_action :ensure_logged_in, only: [:create, :destroy]

	def index
	  @restaurant = Restaurant.find(params[:restaurant_id])
	  @reservations = @restaurant.reservations
  end

def show
	@reservation = Reservation.find(params[:id])
end

def new
	@restaurant = Restaurant.find(params[:restaurant_id])
	@reservation = Reservation.new
end

def edit
	@reservation = Reservation.find(params[:id])
end

def create
	@reservation = Reservation.new(reservation_params)
	@reservation.user = current_user
	@reservation.restaurant_id = params[:restaurant_id]

	if @reservation.save
		redirect_to restaurant_reservations_path(@reservation)
	else
		render :new
	end
end

def update
	@reservation = Reservation.find(params[:id])

	if @reservation.update_attributes(reservation_params)
		redirect_to reservation_path(@reservation)
	else
		render :edit
	end
end

def destroy
	@reservation = Reservation.find(params[:id])
	@reservation.destroy
	redirect_to reservations_path
end

private
def reservation_params
	params.require(:reservation).permit(:date_time, :number_of_guests)
end


end
