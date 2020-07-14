module Spade::Operation
  class Create < Trailblazer::Operation
    step Model(Spade, :new)
    step :reformify

    def reformify(ctx, params:, **)
      ctx[:form] = Spade::Form::SpadeForm.new(ctx[:model])
    end
  end
end