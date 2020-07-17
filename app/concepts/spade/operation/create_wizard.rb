module Spade::Operation
  class CreateWizard < Trailblazer::Operation
    class Present < Trailblazer::Operation
      step Model(Spade, :new), id: :wizard_spade_create_step
      step Contract::Build(constant: Spade::WizardStep), id: :wizard_contract_step
    end

    step Subprocess(Present)

    step Contract::Validate(key: :spade)
    step Contract::Persist()

  end
end