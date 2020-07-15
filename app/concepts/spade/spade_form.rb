class Spade::SpadeForm < Reform::Form
  include Reform::Form::ActiveModel
  property :color
  property :width
  property :length
  model :spade

  validation do
    params do
      required(:color).filled(:string)
      required(:width).filled(:integer)
      required(:length).filled(:integer)
    end

    rule(:width) do
      key.failure('must be bigger than 50') if value <= 50
      key.failure('must be smaller than 150') if value >= 150
    end

    rule(:color) do
      key.failure('must be html color like aff222 or aab') unless value.match(/^(?:[0-9a-fA-F]{3}){1,2}$/)
    end

    rule(:length) do
      key.failure('must be bigger than 50') if value <= 50
      key.failure('must be smaller than 150') if value >= 150
    end

  end
end