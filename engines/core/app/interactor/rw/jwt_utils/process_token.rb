module Rw
  module JwtUtils
    class ProcessToken
      include Interactor

      def call
        if context.auth.present?
          begin
            jwt_payload = JWT.decode(context.auth.split(' ')[1], Devise.secret_key, 'HS256').first
            p jwt_payload['id']
            context.current_user_id = jwt_payload['id']
          rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
            head :unauthorized
            context.fail!
          end
        else
          context.fail!
        end
      end
    end
  end
end
