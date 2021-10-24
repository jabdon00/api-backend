module Rw
  class Success < Rw::StandardError
    def initialize
      super(
          title: I18n.t(:'errors.success.title'),
          status: 200,
          detail: I18n.t(:'errors.success.detail')
      )
    end
  end
end