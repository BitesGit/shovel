module Spade::Cell
  class Index < Trailblazer::Cell
    alias spades model

    private

    def spade_count
      spades.count
    end

    def created_list
      spades[:model].map(&:created_at).join ', '
    end
  end
end