module Spade::Cell
  class FormStep < Trailblazer::Cell
    include SimpleForm::ActionViewExtensions::FormHelper
    alias spade_form_step model
    attr_accessor :step

    def errors
      model.errors.messages
    end

    def wizard_form_url
      spade = spade_form_step.model
      if step_valid?
        if spade.id.nil?
          new_wizard_save_url
        else
          wizard_step_save_url(id: spade.id, step: spade_form_step.step)
        end
      end
    end

    def back_button
      if step_valid? and !spade_form_step.model.id.nil? and spade_form_step.step > 0
        button_to 'Takaisin', wizard_step_url(step: spade_form_step.step - 1, id: spade_form_step.model.id), method: :get
      end
    end

    def next_button
      if !spade_form_step.is_ready? and !spade_form_step.model.id.nil? and spade_form_step.step < spade_form_step.last_step
        button_to 'Seuraava', wizard_step_url(step: spade_form_step.step, id: spade_form_step.model.id), method: :patch
      end
    end

    def step_valid?
      step = spade_form_step.step
      !step.nil? and step >= 0
    end
  end
end