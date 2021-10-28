module Rw
    module Api
        class UserController < ApplicationController
            include Rw::Api
            
            def user_list
                users = Rw::User.all
                render json: users, status: 200
      
            end
        end
    end
end