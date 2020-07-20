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
    @spade_form = result[:'contract.default']
    if result.success?
      redirect_to result[:model], alert: 'Spade created'
      return
    end
    render 'new'
  end

  def new_wizard
    result = Spade::Operation::NewWizard.(ctx)
    @spade_wizard = result[:'contract.default']
    @spade_wizard.step = 0
  end

  def new_wizard_save
    result = Spade::Operation::CreateWizard.(ctx)
    @spade = result[:model]
    if result.success?
      @spade_wizard = result[:'contract.default']
      redirect_to wizard_step_path(id: @spade.id, step: 1)
      return
    end
    @spade_wizard = result[:'contract.default']
    @spade_wizard.step = 0
    render 'new_wizard'
  end

  def wizard_step
    step = params[:step].to_i
    result = Spade::Operation::WizardStep.call(ctx)
    @spade_wizard = result[:'contract.default']
    @spade_wizard.step = step
    if result.success?
      if @spade_wizard.is_ready?
        redirect_to result[:model], alert: 'Spade completed'
        return
      end
      render 'wizard'
      return
    end
    redirect_to spades_path, alert: 'Spade not found'
  end

  def wizard_save
    step = params[:step].to_i
    result = Spade::Operation::UpdateWizard.call(ctx)
    @spade = result[:model]
    @spade_wizard = result[:'contract.default']
    @spade_wizard.step = step + 1
    if result.success? and @spade_wizard.is_ready?
      redirect_to @spade
      return
    end
    redirect_to wizard_step_path(id: @spade_wizard.model.id, step: step + 1)
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

end
