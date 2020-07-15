module Spade::Operation
  class Destroy < Trailblazer::Operation
    step Model(Spade, :find_by)
    step :destroy

    def destroy(ctx, params:, **)
      ctx[:model].destroy
    end
  end
end