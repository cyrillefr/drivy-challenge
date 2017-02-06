require_relative 'rental_service'

module Drivy
  # data rental entry point with rules level
  class RentalServiceWithRules
    def initialize(data_dir, rules_level)
      service_data = DataService.new(data_dir)
      @service_rental = RentalService.new(service_data, rules_level)
    end

    def formatted_rentals
      @service_rental.retrieve_formatted_rentals { @service_rental.generate_json_rentals }
    end

    def formatted_deltas
      @service_rental.retrieve_formatted_deltas { @service_rental.generate_json_deltas }
    end
  end
end
