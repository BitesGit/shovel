module Spade::Form
  class SpadeForm < Reform::Form
    include Reform::Form::ActiveModel
    property :color
    property :width
    property :length


  end
end