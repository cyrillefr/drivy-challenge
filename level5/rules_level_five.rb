require_relative '../app/rules.rb'
require_relative '../app/action'

module Drivy
  # Decreasing rentals rates
  module RulesLevelFive
    include Rules
    include RulesLevelOne
    include RulesLevelTwo
    include RulesLevelThree
    include RulesLevelFour

    # called by rental_service
    def compute_rental_with_rules
      { 'id' => @rental_data.id,
        'actions' => [
          driver_amount,
          owner_amount,
          insurance_amount,
          assistance_amount,
          drivy_amount
        ] }
    end

    def driver_amount
      Action.new('driver', 'debit', compute_driver_debit_amount).to_h
    end

    def owner_amount
      Action.new('owner', 'credit', compute_owner_credit_amount).to_h
    end

    def insurance_amount
      Action.new('insurance', 'credit', compute_insurance_credit_amount).to_h
    end

    def assistance_amount
      Action.new('assistance', 'credit', compute_assistance_credit_amount).to_h
    end

    def drivy_amount
      Action.new('drivy', 'credit', compute_drivy_credit_amount).to_h
    end

    def compute_driver_debit_amount
      compute_deductible_reduction + compute_unit_rental_price
    end

    def compute_owner_credit_amount
      compute_unit_rental_price -
        compute_insurance_credit_amount -
        compute_assistance_credit_amount -
        compute_drivy_fee
    end

    def compute_insurance_credit_amount
      RulesLevelThree.compute_insurance_fee(compute_unit_rental_price)
    end

    def compute_assistance_credit_amount
      compute_roadside_assistance
    end

    def compute_drivy_credit_amount
      compute_drivy_fee + compute_deductible_reduction
    end
  end
end
