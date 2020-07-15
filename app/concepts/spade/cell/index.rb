module Spade::Cell
  class Index < Trailblazer::Cell
    alias spades model

    private

    def spade_count
      spades.count
    end

    def color_list
      spades.map(&:color).uniq.join(', ')
    end

    def new_spade_link
      button_to 'New Spade', new_spade_path, method: :get, class: 'm-2 btn btn-info'
    end
  end
end