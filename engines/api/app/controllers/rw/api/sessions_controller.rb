module Rw
  module Api
    class SessionsController < Devise::SessionsController
      skip_before_action :verify_authenticity_token

      def create        
        user = Rw::User.find_by_email(sign_in_params[:email])        
        if user && user.valid_password?(sign_in_params[:password])
          token =  Rw::JwtUtils::GenerateJwt.call(user: user).result                    
          success = Rw::Utils::SuccessRender.call(object: {token: token, role: user.role, email: user.email})          
          render json: success.result, status: success.status
        else          
          e = Rw::NotValidated.new( I18n.t(:'errors.not_validated.detail'))
          render json: Rw::ErrorSerializer.new(e), status: e.status
        end
      end

      def sign_in_params
        params.require(:user).permit(:email, :password)
      end

    end
  end
end