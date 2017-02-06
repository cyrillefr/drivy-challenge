require_relative '../app/rules'
require_relative '../app/action'

module Drivy
  # Decreasing rentals rates
  module RulesLevelSix
    include Rules
    include RulesLevelOne
    include RulesLevelTwo
    include RulesLevelThree
    include RulesLevelFour
    include RulesLevelFive

    def compute_delta_with_rules(rental_after, rental_modification_id)
      { 'id' => rental_modification_id, 'rental_id' => @rental_data.id,
        'actions' => [
          action_driver_amount_delta(rental_after),
          action_owner_amount_delta(rental_after),
          action_insurance_amount_delta(rental_after),
          action_assistance_amount_delta(rental_after),
          action_drivy_amount_delta(rental_after)
        ] }
    end

    def action_driver_amount_delta(rental_after)
      Action.new('driver', 'debit', compute_driver_debit_amount_delta(rental_after)).to_h
    end

    def action_owner_amount_delta(rental_after)
      Action.new('owner', 'credit', compute_owner_credit_amount_delta(rental_after)).to_h
    end

    def action_insurance_amount_delta(rental_after)
      Action.new('insurance', 'credit', compute_insurance_credit_amount_delta(rental_after)).to_h
    end

    def action_assistance_amount_delta(rental_after)
      Action.new('assistance', 'credit', compute_assistance_credit_amount_delta(rental_after)).to_h
    end

    def action_drivy_amount_delta(rental_after)
      Action.new('drivy', 'credit', compute_drivy_credit_amount_delta(rental_after)).to_h
    end

    def compute_driver_debit_amount_delta(rental_after)
      rental_after.compute_driver_debit_amount - compute_driver_debit_amount
    end

    def compute_owner_credit_amount_delta(rental_after)
      rental_after.compute_owner_credit_amount - compute_owner_credit_amount
    end

    def compute_insurance_credit_amount_delta(rental_after)
      rental_after.compute_insurance_credit_amount - compute_insurance_credit_amount
    end

    def compute_assistance_credit_amount_delta(rental_after)
      rental_after.compute_assistance_credit_amount - compute_assistance_credit_amount
    end

    def compute_drivy_credit_amount_delta(rental_after)
      rental_after.compute_drivy_credit_amount - compute_drivy_credit_amount
    end
  end
end
