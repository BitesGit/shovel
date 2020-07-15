module Spade::Operation
  class Index < Trailblazer::Operation
    step :collect

    def collect(ctx, params:, **)
      ctx[:spades] = Spade.all # insert your business logic here, filter or smt
    end
  end
end