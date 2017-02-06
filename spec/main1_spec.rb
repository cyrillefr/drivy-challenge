require_relative 'spec_helper'
require_relative '../level1/rules_level_one.rb'

# test file output vs. generated output
RSpec.describe Drivy::RentalServiceWithRules do
  describe '#formatted_rentals - level 1' do
    it 'checks json generated output against target output ' do
      checks_output('level1', Drivy::RulesLevelOne)
    end
  end
end
