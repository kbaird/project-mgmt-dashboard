# frozen_string_literal: true

# Generic controller ancestor
class ApplicationController < ActionController::Base
  rescue_from DisallowedError, with: :deny_access

  private

  def current_user_id
    ### TODO(kbaird): Use an expiring token that encodes the user instead
    @current_user_id ||= request.headers['User-Id']
  end

  def deny_access
    render json: { message: 'Operation not permitted' }.to_json, status: :forbidden
  end

  def require_logged_in_as_project_manager
    ProjectManager.find(current_user_id)
  rescue ActiveRecord::RecordNotFound
    raise DisallowedError
  end
end
