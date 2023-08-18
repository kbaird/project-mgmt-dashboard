# frozen_string_literal: true

# Generic controller ancestor
class ApplicationController < ActionController::Base
  rescue_from DisallowedError, with: :deny_access

  private

  def deny_access
    render json: { message: 'Operation not permitted' }.to_json, status: :forbidden
  end

  def current_user_id
    ### TODO(kbaird): Use an expiring token that encodes the user instead
    @current_user_id ||= request.headers['User-Id']
  end
end
