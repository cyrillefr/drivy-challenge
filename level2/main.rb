require_relative '../app/rental_service_with_rules.rb'
require_relative '../level1/rules_level_one.rb'
require_relative 'rules_level_two.rb'

level2 = Drivy::RentalServiceWithRules.new File.absolute_path(__dir__), Drivy::RulesLevelTwo

puts level2.formatted_rentals
