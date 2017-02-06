require_relative '../app/rules.rb'

module Drivy
  # level one rules
  module RulesLevelOne
    include Rules
    # total rental price is based on mileage and time
    # so we will charge:
    # - a per mileage fee (in kms)
    def compute_unit_rental_price
      per_time_fee + per_mileage_fee
    end

    def per_time_fee
      @car.price_per_day * Rules.compute_rental_duration(@rental_data)
    end

    def per_mileage_fee
      @car.price_per_km * @rental_data.distance
    end

    def compute_rental_with_rules
      { 'id' => @rental_data.id, 'price' => compute_unit_rental_price }
    end
  end
end
