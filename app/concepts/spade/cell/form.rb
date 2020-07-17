module Spade::Cell
  class Form < Trailblazer::Cell
    include SimpleForm::ActionViewExtensions::FormHelper
    alias spade_form model # Because of this, you can access 'spade_form' in the cell (spade/view/new.slim)

    def form_url
      if model.id.nil?
        spades_path(spade_form)
      else
        spade_path(spade_form)
      end
    end

    def errors
      model.errors.messages
    end

  end
end