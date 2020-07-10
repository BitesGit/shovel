module Spade::Cell
  class Show < Trailblazer::Cell
    alias spade model

    private

    def measures
      "#{spade.length} x#{spade.width}"
    end
  end
end