module Spade::Cell
  class Show < Trailblazer::Cell
    alias spade model

    private

    def measures
      "<div style=\"height: #{spade.length/5}px; width:#{spade.width/5}px; background: ##{spade.color};\"></div>"
    end
  end
end