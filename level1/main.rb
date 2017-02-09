require_relative '../app/rental_service_with_rules.rb'
require_relative 'rules_level_one.rb'

level1 = Drivy::RentalServiceWithRules.new File.absolute_path(__dir__), Drivy::RulesLevelOne

puts level1.pretty_json_rentals
