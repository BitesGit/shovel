module Spade::Operation
  class Create < Trailblazer::Operation
    class Present < Trailblazer::Operation
      step Model(Spade, :new), id: :new_spade_create_step
      step Contract::Build(constant: Spade::SpadeForm)
    end

    step Subprocess(Present)

    step Contract::Validate(key: :spade)
    step Contract::Persist()

  end
end