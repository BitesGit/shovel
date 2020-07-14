module Spade::Operation
  class Index < Trailblazer::Operation
    step :collect

    def collect(ctx, params:, **)
      ctx[:model] = Spade.all # insert your business logic here
    end
  end
end