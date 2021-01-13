class Api::PainelApiBaseController < ActionController::Base
  attr_reader :current_company

  skip_before_action :verify_authenticity_token
  before_action :set_current_company

  def render_failure(errors)
    render json: { result: :failure, messages: errors }
  end

  def set_current_company
    @current_company ||= Company.first
  end
end
