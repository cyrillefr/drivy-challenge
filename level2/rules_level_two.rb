require_relative '../app/rules.rb'

module Drivy
  # level two rules
  module RulesLevelTwo
    include Rules
    include RulesLevelOne

    # 1 : 100% of price for day one
    # 0.9: 90% of price for day two to four
    # etc.
    PRICING_STRUCTURE =
      { 1 => (1..1),
        0.9 => (2..4),
        0.7 => (5..10),
        0.5 => (11..Float::INFINITY) }
      .freeze

    # total rental price is based on mileage and time
    # so we will charge:
    # - a per time rented fee with decreasing daily rates
    # - a per mileage fee (in kms)
    def compute_unit_rental_price
      per_time_fee + per_mileage_fee
    end

    def per_time_fee
      rates = discount_rates_for_rental_days
      rates.map { |rate| rate * @car.price_per_day }.reduce(&:+).to_i
    end

    # returns an array with discount for each day
    # [1, 0.9, 0.9, 0.7, 0.7 ...]
    # 1 being no discount
    # 0.9 10 % discount
    # etc.
    def discount_rates_for_rental_days
      days_of_rent.map do |day|
        RulesLevelTwo.daily_rate(day)
      end
    end

    # returns daily rate for a specific day in the rent
    def self.daily_rate(day)
      PRICING_STRUCTURE.each do |tarif, jours|
        return tarif if jours.include? day
      end
    end

    # returns an array with each ordinal day of the rent
    # 1 being first day of rent
    # 2 being second day of rent
    # etc ...
    def days_of_rent
      (1..(Rules.compute_rental_duration(@rental_data))).to_a
    end

    # def per_mileage_fee
    # cf RulesLevelOne

    # def compute_rental_with_rules
    # cf RulesLevelOne
  end
end
