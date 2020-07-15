require "reform/rails"

require 'reform/form/dry'

Rails.application.config.reform.validations = :dry
Rails.application.config.reform.enable_active_model_builder_methods = true

Reform::Form.class_eval do
  feature Reform::Form::Dry
end