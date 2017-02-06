require_relative '../app/rules.rb'

module Drivy
  # Decreasing rentals rates
  # are described in rules level 2.
  # Same rules apply here with
  # some new features
  module RulesLevelFour
    include Rules
    include RulesLevelOne
    include RulesLevelTwo
    include RulesLevelThree

    ADDDITIONAL_CHARGE_FOR_DEDUCTIBLE_OPTION = 400

    def reduce_deductible?
      # rappel @rental_data: openStruct
      @rental_data.deductible_reduction ? true : false
    end

    def compute_deductible_reduction
      if reduce_deductible?
        Rules.compute_rental_duration(@rental_data) * ADDDITIONAL_CHARGE_FOR_DEDUCTIBLE_OPTION
      else
        0
      end
    end

    # called by rental_service
    def compute_rental_with_rules
      { 'id' => @rental_data.id,
        'price' => compute_unit_rental_price,
        'options' =>
           { 'deductible_reduction' => compute_deductible_reduction },
        'commission' =>
           {  'insurance_fee' => RulesLevelThree.compute_insurance_fee(compute_unit_rental_price),
              'assistance_fee' => compute_roadside_assistance,
              'drivy_fee' => compute_drivy_fee } }
    end
  end
end
