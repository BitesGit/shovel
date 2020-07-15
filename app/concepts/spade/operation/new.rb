module Spade::Operation
  class New < Trailblazer::Operation
    class Present < Trailblazer::Operation
      step Model(Spade, :new)
    end
    step Subprocess(Present)
    step Contract::Build(constant: Spade::Contract)
  end
end