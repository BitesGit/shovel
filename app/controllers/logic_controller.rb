class LogicController < ApplicationController
  def if_this_then_that
    # Activity call signature return value:
    # signal, [ctx] = Logic::Operation::CheckAnimal.(ctx)
    signal, result = Logic::Operation::CheckAnimal.(ctx)
    if signal.to_h[:semantic] == :found
      @result = result[0][:sound] # ctx is result[0]
    else
      @result = 'Not found'
    end
    unless result[0][:exception_class].nil?
      @exception = "Neatly handled an exception: #{result[0][:exception_class]}"
    end
  end
end
