module Spade::Operation
  class WizardStep < Trailblazer::Operation
    step Model(Spade, :find_by)
    step Contract::Build(constant: Spade::WizardStep)
  end
end