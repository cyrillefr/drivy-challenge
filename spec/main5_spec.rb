require_relative 'spec_helper'
require_relative '../level1/rules_level_one'
require_relative '../level2/rules_level_two'
require_relative '../level3/rules_level_three'
require_relative '../level4/rules_level_four'
require_relative '../level5/rules_level_five'

# test file output vs. generated output
RSpec.describe Drivy::RentalServiceWithRules do
  describe '#formatted_rentals - level 5' do
    it 'checks json generated output against target output ' do
      checks_output('level5', Drivy::RulesLevelFive)
    end
  end
end
