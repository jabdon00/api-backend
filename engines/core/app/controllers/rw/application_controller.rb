module Rw
  class ApplicationController < ActionController::Base    
    respond_to :json
    before_action :process_token

    rescue_from Rw::NotValidated, with: :render_error
    rescue_from Rw::PermissionError, with: :render_error
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from Rw::NotFound, with: :render_error
    rescue_from Rw::NotVerified, with: :render_error
    rescue_from Rw::Unauthorized, with: :render_error
    rescue_from JWT::DecodeError, with: :render_error
 

    private

    def render_error(e)      
      render json: Rw::ErrorSerializer.new(e), status: e.status
    end
  
    def process_token
      @current_user_id = Rw::JwtUtils::ProcessToken.call(auth: request.headers['Authorization']).current_user_id
    end
  
    # If user has not signed in, return unauthorized response (called only when auth is needed)
    def authenticate_user!(options = {})
      head :unauthorized unless signed_in?
    end
  
    # set Devise's current_user using decoded JWT instead of session
    def current_user
      @current_user ||= super || User.find(@current_user_id)
    end
  
    # check that authenticate_user has successfully returned @current_user_id (user is authenticated)
    def signed_in?
      @current_user_id.present?
    end
    
  end
end
