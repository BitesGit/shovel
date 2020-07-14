class SpadesController < ApplicationController

  def new
    ctx = {params: {}}
    result = Spade::Operation::Create.(ctx) # after this op, ctx[:model] contains Spade object
    render html: cell(Spade::Cell::New, result[:form])
  end

  def index
    ctx = {params: {}}
    Spade::Operation::Index.([ctx, {}], {}) # after this op, ctx[:form] contains Reform object
    render html: cell(Spade::Cell::Index, ctx[:model])
  end
end
