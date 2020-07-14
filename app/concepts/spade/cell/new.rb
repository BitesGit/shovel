module Spade::Cell
  class New < Trailblazer::Cell
    include SimpleForm::ActionViewExtensions::FormHelper
    alias spade model
    attr_accessor :output_buffer

  end
end