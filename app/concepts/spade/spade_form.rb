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
      required(:length).filled(:integer)
    end

    rule(:width) do
      key.failure('must be bigger than 50') if value <= 50
      key.failure('must be smaller than 150') if value >= 150
    end

    rule(:length) do
      key.failure('must be bigger than 50') if value <= 50
      key.failure('must be smaller than 150') if value >= 150
    end

  end
end