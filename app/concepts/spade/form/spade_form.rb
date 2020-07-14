module Spade::Form
  class SpadeForm < Reform::Form
    include SimpleForm::Helpers
    include Reform::Form::ActiveModel::ModelReflections
    property :color
    property :width
    property :length


  end
end