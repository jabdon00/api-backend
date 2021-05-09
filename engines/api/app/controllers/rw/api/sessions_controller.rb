module Rw
  module Api
    class SessionsController < Devise::SessionsController
      skip_before_action :verify_authenticity_token

      def create
        user = Rw::User.find_by_email(sign_in_params[:email])

        if user && user.valid_password?(sign_in_params[:password])
          token = user.generate_jwt
          render json: {token: token, status: 200}
        else
          render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
        end
      end

      def sign_in_params
        params.require(:user).permit(:email, :password)
      end

    end
  end
end