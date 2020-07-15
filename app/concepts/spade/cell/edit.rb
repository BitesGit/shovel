module Spade::Cell
  class Edit < Trailblazer::Cell
    include SimpleForm::ActionViewExtensions::FormHelper
    alias spade_form model # Because of this, you can access 'spade_form' in the cell (spade/view/new.slim)

    def errors
      model.errors.messages
    end

  end
end