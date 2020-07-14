require "reform/form/dry"

Reform::Form.class_eval do
  include Reform::Form::Dry
end

Shovel::Application.config.trailblazer.enable_loader = false
