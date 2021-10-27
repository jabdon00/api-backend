module Rw
    module Utils
        class SuccessRender
            include Interactor
        
            def call
                e = Rw::Success.new
                result = Rw::ErrorSerializer.new(e).to_h
                result = result.merge({result: context.object}) if context.object
                context.result = result
                context.state = e.status
            end
          
        end        
    end
end
