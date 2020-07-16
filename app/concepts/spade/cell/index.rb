module Spade::Cell
  class Index < Trailblazer::Cell
    alias spades model

    private

    def spade_count
      spades.count
    end

    def color_list
      divs = ''
      spades.map(&:color).uniq.each do |c|
        divs << "<div class=\"col-2 m-2\" style=\"background: ##{c}; width: 50px; height: 50px;\"></div>"
      end
      divs
    end

    def new_spade_link
      button_to 'New Spade', new_spade_path, method: :get, class: 'm-2 btn btn-info'
    end
  end
end