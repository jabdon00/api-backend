require 'jwt'

module Rw
    module JwtUtils
        class GenerateJwt
            include Interactor
            def call
                user = context.user
                context.result = JWT.encode({id: user.id, exp: 60.days.from_now.to_i}, Devise.secret_key,'HS256')
            end
        end
    end
    
end