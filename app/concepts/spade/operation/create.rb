module Spade::Operation
  class Create < Trailblazer::Operation
    class Present < Trailblazer::Operation
      step Model(Spade, :new)
      step Contract::Build(constant: Spade::Contract)
    end

    step Subprocess(Present)

    step Contract::Validate(key: :spade)
    step Contract::Persist()
  end
end