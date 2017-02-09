require 'json'
require 'date'

require_relative 'data_service'
require_relative 'rental'

module Drivy
  # Drivy 's rental service
  # computes prices of rentals
  class RentalService
    def initialize(data_service, rules_level)
      @data_service = data_service
      # data populated by data service
      @rental_data = {}
      @rules_level = rules_level
    end

    def populate_data_rentals
      @rental_data = @data_service.data_rentals
    end

    def compute_rentals
      # for each input rental, get the corresponding rental object
      @rental_data.rentals_made.map do |rental_made|
        rental = get_rental_object(rental_made)
        rental.compute_rental_with_rules
      end
    end

    # from actual data construct a rental object
    def get_rental_object(rental_made)
      selected_car = select_rented_car(rental_made.car_id)
      Rental.new(selected_car, rental_made, @rules_level)
    end

    # given the rented car, retrieve matching car in the list
    def select_rented_car(rented_car_id)
      @rental_data.cars.find { |car| car.id == rented_car_id }
    end

    def compute_deltas
      @rental_data.rental_modifications.map do |rental_modification|
        rental_made = get_rental_by_id rental_modification.rental_id
        rental_before = get_rental_object(rental_made)

        rental_after = rental_before.clone.update(rental_modification)
        rental_before.compute_delta_with_rules(rental_after, rental_modification.id)
      end
    end

    def get_rental_by_id(id)
      @rental_data.rentals_made.find { |rental_made| rental_made.id == id }
    end

    def rentals
      populate_data_rentals
      compute_rentals
    end

    def deltas
      populate_data_rentals
      compute_deltas
    end
  end
end
