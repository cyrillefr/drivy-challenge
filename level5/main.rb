require_relative '../app/rental_service_with_rules.rb'
require_relative '../level1/rules_level_one.rb'
require_relative '../level2/rules_level_two.rb'
require_relative '../level3/rules_level_three.rb'
require_relative '../level4/rules_level_four.rb'
require_relative 'rules_level_five.rb'

level5 = Drivy::RentalServiceWithRules.new File.absolute_path(__dir__), Drivy::RulesLevelFive

puts level5.formatted_rentals
