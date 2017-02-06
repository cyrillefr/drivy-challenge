require_relative '../app/rental_service_with_rules.rb'
require_relative '../level1/rules_level_one.rb'
require_relative '../level2/rules_level_two.rb'
require_relative '../level3/rules_level_three.rb'
require_relative 'rules_level_four.rb'

level4 = Drivy::RentalServiceWithRules.new File.absolute_path(__dir__), Drivy::RulesLevelFour

puts level4.formatted_rentals
