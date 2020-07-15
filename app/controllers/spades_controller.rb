class SpadesController < ApplicationController

  def show
    @spade = Spade.find_by(id: params[:id])
    unless @spade
      redirect_to spades_path, alert: 'Spade not found'
    end
  end

  def new
    result = Spade::Operation::New.(ctx)
    @spade_form = result[:'contract.default']
  end

  def create
    result = Spade::Operation::Create.(ctx)
    if result.success?
      redirect_to result[:model], alert: 'Spade created'
      return
    end
    @spade_form = result[:'contract.default']
    render 'new'
  end

  def edit
    result = Spade::Operation::Edit.call(ctx)
    unless result.success?
      redirect_to spades_path, alert: 'Spade not found'
      return
    end
    @spade_form = result[:'contract.default']
  end

  def update
    result = Spade::Operation::Update.call(ctx)
    @spade = result[:model]
    if result.success?
      redirect_to @spade
      return
    end
    @spade_form = result[:'contract.default']
    render 'edit'
  end

  def index
    ctx = {params: {}}
    Spade::Operation::Index.([ctx, {}], {})
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
