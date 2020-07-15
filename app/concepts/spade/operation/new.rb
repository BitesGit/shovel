module Spade::Operation
  class New < Trailblazer::Operation
    class PresentNew < Trailblazer::Operation
      step Model(Spade, :new), id: :new_spade_step
    end
    step Subprocess(PresentNew)
    step Contract::Build(constant: Spade::SpadeForm)
  end
end