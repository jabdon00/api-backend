module Rw
  class NotEnoughDays < Dk::StandardError
    def initialize
      super(
          title: I18n.t(:'errors.not_enough_days.title'),
          status: 422,
          detail: I18n.t(:'errors.not_enough_days.detail')
      )
    end
  end
end