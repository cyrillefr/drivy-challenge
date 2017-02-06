module Drivy
  # Rental object abstracts object represented in output.json file
  class Rental
    def initialize(car, rental_data, rules_level)
      extend rules_level
      @car = car
      @rental_data = rental_data
    end

    def clone
      deepcopy
    end

    # The Ruby Programming Language
    # 3.8.9 Marshaling objects
    # use : for cloning
    def deepcopy
      Marshal.load(Marshal.dump(self))
    end

    # parameter: open struct object for rental data
    # open struct holds keys and values in a
    # @table instance variable
    # rental_data_object : another rental object
    def update(rental_data_object)
      # update every item except id
      @rental_data.instance_variable_set(
        :@table, merge_without_id(rental_data_object)
      )
      self
    end

    def merge_without_id(rental_data_object)
      @rental_data.instance_variable_get(:@table)
                  .merge(rental_data_object.instance_variable_get(:@table)) do |key, oldval, newval|
        (key == :id ? oldval : newval)
      end
    end
  end
end
