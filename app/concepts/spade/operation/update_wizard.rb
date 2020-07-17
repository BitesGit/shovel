module Spade::Operation
  class UpdateWizard < Trailblazer::Operation
    step Model(Spade, :find_by)
    step Contract::Build(constant: Spade::WizardStep)
    step Contract::Validate(key: :spade)
    step Contract::Persist()
  end
end