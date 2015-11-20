class Reservation < ActiveRecord::Base
	belongs_to :user
	belongs_to :restaurant

	validate :capacity_exists

	def capacity_exists
		if restaurant.reservations.where(date_time: self.date_time).sum(:number_of_guests) + self.number_of_guests > 100
			self.errors.add(:number_of_guests, "Sorry")
		end
	end

end

