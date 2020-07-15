class Spade::Contract < Reform::Form
  include Reform::Form::ActiveModel
  property :color, validates: {presence: true}
  property :width
  property :length


end