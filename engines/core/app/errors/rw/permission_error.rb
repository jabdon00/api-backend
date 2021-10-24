module Rw
  class PermissionError < Rw::StandardError
    def initialize
      super(
          title: I18n.t(:'errors.permission_error.title'),
          status: 403,
          detail: I18n.t(:'errors.permission_error.detail')
      )
    end
  end
end