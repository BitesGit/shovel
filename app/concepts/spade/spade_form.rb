class Spade::SpadeForm < Reform::Form
  include Reform::Form::ActiveModel
  property :color
  property :width
  property :length
  model :spade

  validation do
    params do
      required(:color).filled
      required(:width).filled(:integer)
    end

    rule(:width) do
      key.failure('must be bigger than 50') if value <= 50
    end

  end
end