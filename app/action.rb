module Drivy
  # Map an action (who, transaction type ie. debit/credit, amount)
  class Action
    def initialize(who, transaction_direction, sum)
      @who = who
      @transaction_direction = transaction_direction
      @amount = sum.abs
      @type = type(sum)
    end

    def type(sum)
      sum_is_positive = sum > 0

      @type = if @transaction_direction == 'credit'
                sum_is_positive ? 'credit' : 'debit'
              else
                sum_is_positive ? 'debit' : 'credit'
              end
    end

    # Utility for json
    def to_h
      { 'who' => @who, 'type' => @type, 'amount' => @amount }
    end
  end
end
