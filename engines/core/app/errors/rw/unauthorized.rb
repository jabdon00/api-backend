module Rw
  class Unauthorized < Dk::StandardError
    def initialize
      super(
          title: I18n.t(:'errors.unauthorized.title'),
          status: 401,
          detail: I18n.t(:'errors.unauthorized.detail'),
          source: {}
      )
    end
  end
end
