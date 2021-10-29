module Rw
    module Utils
        class ErrorRender
            include Interactor
        
            def call
                e = Rw::Success.new
                result = Rw::ErrorSerializer.new(e).to_h
                result = result.merge(context.object) if context.object
                context.result = result
                context.state = e.status
            end
          end
        end        
    end
end
