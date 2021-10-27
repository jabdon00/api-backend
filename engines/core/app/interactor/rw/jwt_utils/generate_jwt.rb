module Rw
    module JwtUtils
        class GenerateJwt
            include Interactor
            def call
                context.result = context.user.generate_jwt
            end
        end
    end
    
end