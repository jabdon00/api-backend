module Rw
  class VerificationCodeNotValidated < Dk::StandardError
    def initialize
      super(
          title: I18n.t(:'errors.verification_code_not_validated.title'),
          status: 422,
          detail: I18n.t(:'errors.verification_code_not_validated.detail')
      )
    end
  end
end