module Spade::Cell
  class New < Trailblazer::Cell
    include SimpleForm::ActionViewExtensions::FormHelper
    alias spade model

  end
end