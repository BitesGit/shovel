module Spade::Operation
  class Create < Trailblazer::Operation
    step :dummy
    #step Model(Spade, :new)
    def dummy(options, params:, **)
      puts "DUMMy"
    end
  end
end