# root namespace
module Drivy
  # a module for rules/utility methods
  # that apply to every use case
  module Rules
    def self.compute_rental_duration(rental)
      compute_duration(rental.end_date, rental.start_date)
    end

    def self.compute_duration(date_end, date_start)
      (Date.parse(date_end) - Date.parse(date_start) + 1).to_i
    end
  end
end
