class Spade::WizardStep < Spade::SpadeForm
  attr_accessor :step

  def is_ready?
    self.step >= step_count
  end

  def last_step
    step_count - 1
  end
  def step_count
    3
  end

end