module Rw
    module Utils
        class Permission
            include Interactor

            def call
                permissionTable = [
                    {path: '/' , user: true , admin: true, supervisor: true , add: true , edit: true, delete: true},
                    {path: '/dashboard' , user: false , admin: true, supervisor: true , add: true , edit: true, delete: true}
                ]                
                admin = context.user.admin?
                supervisor = context.user.supervisor?
                user = context.user.user?
                context.result = permissionTable.find_all{ |x| x[:admin] == admin || x[:supervisor] == supervisor || x[:user] == user }
                    
            end
        end
    end
end