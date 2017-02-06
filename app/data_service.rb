require 'ostruct'

# Root module
module Drivy
  # Handles data fetching and parsing
  class DataService
    DATA_FILE = 'data.json'.freeze

    def initialize(data_directory)
      @data_directory = data_directory
      @raw_data = {}
      @rental_data = {}
    end

    def data_rentals
      fetch_data
      extract_data_rentals
      OpenStruct.new(@rental_data)
    end

    private

    def fetch_data
      @raw_data = File.open(File.join(@data_directory, DATA_FILE)) do |file|
        JSON.parse(file.read)
      end
    end

    def extract_data_rentals
      extract_cars
      extract_rentals
      extract_rental_modifications
    end

    def extract_cars
      @rental_data['cars'] = @raw_data['cars'].map do |car|
        OpenStruct.new car
      end
    end

    def extract_rentals
      @rental_data['rentals_made'] = @raw_data['rentals'].map do |rental|
        OpenStruct.new rental
      end
    end

    def extract_rental_modifications
      return unless @raw_data.key? 'rental_modifications'
      @rental_data['rental_modifications'] = @raw_data['rental_modifications'].map do |rental_modification|
        OpenStruct.new rental_modification
      end
    end
  end
end
