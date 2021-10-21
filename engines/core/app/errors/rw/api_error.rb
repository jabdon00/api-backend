module Rw
  class ApiError < Dk::StandardError
    def initialize
      super(
          title: I18n.t(:'errors.api_error.title'),
          status: 404,
          detail: I18n.t(:'errors.api_error.detail')
      )
    end
  end
end