module Rw
  module Api
    class UserController < ApplicationController
      def user_list    
        auth = Rw::JwtUtils::ProcessToken.call(auth: request.headers['Authorization'])
        if auth.success?
          users = Rw::UserSerializer.new(Rw::User.all).serializable_hash
          success = Rw::Utils::SuccessRender.call(object: users)
          render json: success.result, status: success.status
        else
          e = Rw::Unauthorized.new()
          render json: Rw::ErrorSerializer.new(e), status: e.status
        end
      end
    end
  end
end
