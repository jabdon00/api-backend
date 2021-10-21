# frozen_string_literal: true

module Rw
  module Api
    class RegistrationsController < Devise::RegistrationsController
      skip_before_action :verify_authenticity_token

      def create
        p sign_up_params
        user = Rw::User.new(sign_up_params)

        if user.save
          token = user.generate_jwt
          render json: { token: token, status: 200 }
        else
          render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
        end
      end

      def sign_up_params
        params.require(:user).permit(:email, :password, :password_confirmation)
      end
    end
  end
end
