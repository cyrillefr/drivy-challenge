require_relative 'spec_helper'
require_relative '../level1/rules_level_one'
require_relative '../level2/rules_level_two'
require_relative '../level3/rules_level_three'

# test file output vs. generated output
RSpec.describe Drivy::RentalServiceWithRules do
  describe '#formatted_rentals - level 3' do
    it 'checks json generated output against target output ' do
      checks_output('level3', Drivy::RulesLevelThree)
    end
  end
end
