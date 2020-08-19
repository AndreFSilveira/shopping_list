class ApplicationController < ActionController::API
  rescue_from ActionController::RoutingError,           with: -> { render_404  }
  rescue_from ActiveRecord::RecordNotFound,             with: -> { render_404  }
  rescue_from ActionController::ParameterMissing,       with: -> { render_400  }

  def render_404
    render json: 'no-content', status: :not_found
  end

  def api
    render json: 'API online', status: :ok
  end

  def render_400
    render json: {errors: "Parametros inválidos"}, status: :not_found
  end

end
