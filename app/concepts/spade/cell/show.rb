module Spade::Cell
  class Show < Trailblazer::Cell
    alias spade model

    def to_div
      """
      <div style=\"margin-top: #{spade.width/2}px; height: 4px; border: 1px solid black; background: ##{spade.color};\"></div>
      <div style=\"margin-top: -#{spade.width/4}px; height: #{spade.width/2}px; width:#{spade.length/2}px; background: ##{spade.color}; border-radius: 6px 0 0 6px\"></div>
      <div style=\"margin-top: -#{spade.width/2}px; float: right; height: #{spade.width/2 - 4}px; width:4px; background: black;\"></div>"""
    end
  end
end