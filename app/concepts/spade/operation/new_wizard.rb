module Spade::Operation
  class NewWizard < Trailblazer::Operation
    step Subprocess(New::Present)
    step Contract::Build(constant: Spade::WizardStep)
  end
end