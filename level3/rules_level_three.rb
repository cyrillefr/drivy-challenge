require_relative '../app/rules.rb'

module Drivy
  # Decreasing rentals rates
  # are described in rules level 2.
  # Same rules apply here with
  # some new features
  module RulesLevelThree
    include Rules
    include RulesLevelOne
    include RulesLevelTwo

    DRIVY_COMMISSION = 0.3
    ROADSIDE_ASSISTANCE_DAILY_PRICE = 1

    # called by rental_service
    def compute_rental_with_rules
      { 'id' => @rental_data.id,
        'price' => compute_unit_rental_price,
        'commission' =>
      { 'insurance_fee' => RulesLevelThree.compute_insurance_fee(compute_unit_rental_price),
        'assistance_fee' => compute_roadside_assistance,
        'drivy_fee' => compute_drivy_fee } }
    end

    def self.compute_insurance_fee(price)
      ((price * DRIVY_COMMISSION) / 2).to_i
    end

    def compute_roadside_assistance
      Rules.compute_rental_duration(@rental_data) * ROADSIDE_ASSISTANCE_DAILY_PRICE * 100
    end

    def compute_drivy_fee
      ((compute_unit_rental_price * DRIVY_COMMISSION) -
       RulesLevelThree.compute_insurance_fee(compute_unit_rental_price) -
       compute_roadside_assistance).to_i
    end
  end
end
