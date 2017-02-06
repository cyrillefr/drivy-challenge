require 'simplecov'
SimpleCov.start

require_relative '../app/rental_service_with_rules'
require_relative 'checks_output_helper.rb'

RSpec.configure do |config|
  config.color = true
  config.formatter = :documentation
end
