module Rw
    module Utils
        class SuccessRender
            include Interactor
        
            def call
                e = Dk::Success.new
                result = Dk::ErrorSerializer.new(e).to_h
                result = result.merge(context.object) if context.object
                context.result = result
                context.state = e.status
            end
          end
        end        
    end
end
