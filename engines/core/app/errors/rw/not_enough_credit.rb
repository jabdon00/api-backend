module Rw
  class NotEnoughCredit < Dk::StandardError
    def initialize
      super(
          title: I18n.t(:'errors.not_enough_credit.title'),
          status: 422,
          detail: I18n.t(:'errors.not_enough_credit.detail')
      )
    end
  end
end