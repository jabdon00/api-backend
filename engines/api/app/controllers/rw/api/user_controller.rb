module Rw
  module Api
    class UserController < ApplicationController
      def user_list    
        auth = Rw::JwtUtils::ProcessToken.call(auth: request.headers['Authorization'])
        if auth.success?
          users = Rw::User.all
          render json: users, status: 200
        else
          e = Rw::Unauthorized.new()
          render json: Rw::ErrorSerializer.new(e), status: e.status
        end
      end
    end
  end
end
