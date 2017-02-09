require_relative 'rental_service'

module Drivy
  # data rental entry point with rules level
  class RentalServiceWithRules
    def initialize(data_dir, rules_level)
      service_data = DataService.new(data_dir)
      @service_rental = RentalService.new(service_data, rules_level)
    end

    def fetch_rentals
      rentals = { 'rentals' => @service_rental.rentals }
      if block_given?
        yield rentals
      else
        rentals
      end
    end

    def fetch_deltas
      deltas = { 'rental_modifications' => @service_rental.deltas }
      if block_given?
        yield deltas
      else
        deltas
      end
    end

    def pretty_json_rentals
      fetch_rentals { |rentals| JSON.pretty_generate rentals }
    end

    def json_rentals
      fetch_rentals { |rentals| JSON.generate rentals }
    end

    def pretty_json_deltas
      fetch_deltas { |deltas| JSON.pretty_generate deltas }
    end

    def json_deltas
      fetch_deltas { |deltas| JSON.generate deltas }
    end
  end
end
