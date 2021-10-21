module Rw
  class PaymentError < Dk::StandardError
    def initialize(errors)
      super(
          title: I18n.t(:'errors.payment_error.title'),
          status: 600,
          detail: errors
      )
    end
  end
end