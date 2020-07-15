module Spade::Operation
  class Update < Trailblazer::Operation
    step Subprocess(Edit::Present)
    step Contract::Validate(key: :spade)
    step Contract::Persist()
  end
end