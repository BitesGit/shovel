class LogicController < ApplicationController
  def if_this_then_that
    # Activity call signature return value:
    # signal, [ctx] = Logic::Operation::CheckAnimal.(ctx)
    signal, result = Logic::Operation::CheckAnimal.(ctx)
    @found = "Signal: #{signal.to_h[:semantic].capitalize}"
    @result = result[0][:sound]
    unless result[0][:exception_class].nil?
      @exception = "Neatly handled an exception: #{result[0][:exception_class]}"
    end
  end
end
