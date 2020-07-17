module Spade::Operation
  class NextStep < Trailblazer::Operation
    step Subprocess(Edit::Present)
    step Contract::Validate(key: :spade)
    step Contract::Persist()
  end
end