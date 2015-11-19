class Restaurant < ActiveRecord::Base

	has_many :reservations
	has_many :user, through: :reservations

	validates :name, :address, :phone_number, :type_of_cuisine, presence: true
end
