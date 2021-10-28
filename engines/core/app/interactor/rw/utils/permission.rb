module Rw
    module Utils
        class Permission
            include Interactor

            def call
                permissionTable = [
                    {path: '/' , user: true , supervisor: true },
                    {path: '/dashboard' , user: true , supervisor: true }
                    {path: '/users' , user: false , supervisor: false }
                ]                
                userDetailPermission = [{path: '/', add: true, edit: true, delete: true},
                                        {path: '/dashboard', add: true, edit: true, delete: true},
                                        {path: '/users', add: false, edit: false, delete: false}   
                    ]
                supervisorDetailPermission = [{path: '/', add: true, edit: true, delete: true},
                                              {path: '/dashboard', add: true, edit: true, delete: true},
                                              {path: '/users', add: false, edit: false, delete: false}   
                ]
                admin = context.user.admin?
                supervisor = context.user.supervisor?
                user = context.user.user?
                if(admin)
                    context.permissionTable = permissionTable
                else    
                    context.permissionTable = permissionTable.find_all{ |x| x[:supervisor] == supervisor || x[:user] == user }
                end    
                
                context.userDetailPermission = userDetailPermission
                context.supervisorDetailPermission = supervisorDetailPermission    
            end
        end
    end
end