module Rw
    class UserSerializer
        include FastJsonapi::ObjectSerializer
        attributes :id, :email                
    end
end