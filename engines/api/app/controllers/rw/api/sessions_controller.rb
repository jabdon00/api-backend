module Rw
  module Api
    class SessionsController < Devise::SessionsController
      skip_before_action :verify_authenticity_token

      def create
        user = Rw::User.find_by_email(sign_in_params[:email])
        p user
        p "------------------------"
        if user && user.valid_password?(sign_in_params[:password])
          token =  Rw::JWtUtils::GenerateJwt.call(user: user)          
          success = Rw::Utils::SuccessRender.call(object: user)
          render json: success,token: token, status: success.status
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