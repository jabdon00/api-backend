module Rw
  class NotVerified < Dk::StandardError
    def initialize
      super(
          title: I18n.t(:'errors.not_verified.title'),
          status: 403,
          detail: I18n.t(:'errors.not_verified.detail')
      )
    end
  end
end