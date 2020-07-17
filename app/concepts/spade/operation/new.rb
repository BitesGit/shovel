module Spade::Operation
  class New < Trailblazer::Operation
    class Defaults < Trailblazer::Operation
      step :defaults

      def defaults(ctx, params:, **)
        ctx[:model].color = 'a00'
        ctx[:model].width = 100
        ctx[:model].length = 140
        ctx[:model].cost = 100
        ctx[:model].product_name = "SoWell"
      end
    end
    class Present < Trailblazer::Operation
      step Model(Spade, :new)
      step Subprocess(Defaults)
    end
    step Subprocess(Present)
    step Contract::Build(constant: Spade::SpadeForm)
  end
end