require "reform/form/dry"

Reform::Form.class_eval do
  include Reform::Form::Dry
end

Shovel::Application.config.trailblazer.enable_loader = false

Cell::Concept.class_eval do
  include ActionView::Helpers::TranslationHelper # include your helpers here.
  include Cell::Slim # or Cell::Slim, or Cell::Haml after that
end