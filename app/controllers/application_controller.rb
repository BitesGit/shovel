class ApplicationController < ActionController::Base

  protected

  def ctx
    { params: params.to_unsafe_h }
  end
end
