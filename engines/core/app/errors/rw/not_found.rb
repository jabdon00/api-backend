module Rw
  class NotFound < Rw::StandardError
    def initialize
      super(
          title: I18n.t(:'errors.not_found.title'),
          status: 404,
          detail: I18n.t(:'errors.not_found.detail')
      )
    end
  end
end