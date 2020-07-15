module Spade::Operation
  class Edit < Trailblazer::Operation
    class Present < Trailblazer::Operation
      step Model(Spade, :find_by)
      step Contract::Build(constant: Spade::Contract)
    end
    step Subprocess(Present)
  end
end