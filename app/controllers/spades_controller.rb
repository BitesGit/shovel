class SpadesController < ApplicationController

  def new
    Spade::Operation::Create.(params: {dum: 'dummy'})
    render html: cell(Spade::Cell::New)
  end

  def index
    ctx = {params: {}}
    Spade::Operation::Index.([ctx, {}], {})
    render html: cell(Spade::Cell::Index, ctx)
  end
end
