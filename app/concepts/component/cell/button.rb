module Component::Cell
  class Button < Trailblazer::Cell

    def show
      button_to model.label, model.url, {method: model.http_method, class: 'm-2 btn btn-info'}
    end
  end
end