def compare_two_strings(str_one, str_two)
  expect(str_one).to match(str_two)
end

def read_output(level)
  output_rentals = File.open(File.join(__dir__, '../' + level + '/output.json')) do |file|
    file.read.gsub(/\s/, '')
  end
  output_rentals
end

def generate_output(level, mod)
  service = Drivy::RentalServiceWithRules.new File.join(__dir__, '../' + level), mod
  service.send(check_method(level))
end

def checks_output(level, mod)
  output = read_output(level)
  generated = generate_output(level, mod)
  compare_two_strings(output, generated)
end

def check_method(level)
  arr = { 'level1' => :formatted_rentals,
          'level2' => :formatted_rentals,
          'level3' => :formatted_rentals,
          'level4' => :formatted_rentals,
          'level5' => :formatted_rentals,
          'level6' => :formatted_deltas }
  arr.fetch level
end
