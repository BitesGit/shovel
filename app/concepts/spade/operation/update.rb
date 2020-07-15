module Spade::Operation
  class Update < Trailblazer::Operation
    class Present < Trailblazer::Operation
      step Model(Spade, :find_by)
      step Contract::Build(constant: Spade::Contract)
    end
    step Subprocess(Present)

    step Contract::Validate(key: :spade)
    step Contract::Persist()
  end
end