require_relative '../app/rental_service_with_rules.rb'
require_relative '../level1/rules_level_one.rb'
require_relative '../level2/rules_level_two.rb'
require_relative 'rules_level_three.rb'

level3 = Drivy::RentalServiceWithRules.new File.absolute_path(__dir__), Drivy::RulesLevelThree

puts level3.pretty_json_rentals
