module Spade::Cell
  class Index < Trailblazer::Cell
    alias spades model

    private

    def spade_count
      spades.count
    end

    def created_list
      spades.map(&:created_at).join ', '
    end

    def new_spade_link
      link_to 'New Spade', new_spade_path
    end
  end
end