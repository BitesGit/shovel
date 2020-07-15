module Spade::Operation
  class New < Trailblazer::Operation
    class Present < Trailblazer::Operation
      step Model(Spade, :new)
      step Contract::Build(constant: Spade::SpadeForm)
    end
    step Subprocess(Present)
  end
end