class SpadesController < ApplicationController

  def show
    @spade = Spade.find_by(id: params[:id])
    unless @spade
      redirect_to spades_path, alert: 'Spade not found'
    end
  end

  def new
    result = Spade::Operation::New.(ctx) # after this op, ctx[:model] contains Spade object
    render html: cell(Spade::Cell::New, result[:model])
  end

  def create
    result = Spade::Operation::Create.(ctx)
    if result.success?
      redirect_to result[:model]
    else
      render html: cell(Spade::Cell::New, result[:'contract.default'])
    end
  end

  def edit
    result = Spade::Operation::Edit.call(ctx)
    if result.success?
      render html: cell(Spade::Cell::Edit, result[:model])
    else
      redirect_to spades_path, alert: 'Spade not found'
    end
  end

  def update
    result = Spade::Operation::Update.call(ctx)
    if result.success?
      redirect_to result[:model]
    else
      render_cell(Spade::Cell::Edit, result[:model])
    end
  end

  def index
    ctx = {params: {}}
    Spade::Operation::Index.([ctx, {}], {}) # after this op, ctx[:spades] contains spades
    @spades = ctx[:spades]
  end

  def destroy
    result = Spade::Operation::Destroy.call(ctx)
    if result.success?
      redirect_to spades_path
    else
      redirect_to result[:model]
    end
  end

  private

  def ctx
    { params: params.to_unsafe_h }
  end
end
