module Rw
  class NotValidated < Dk::StandardError
    def initialize(errors)
      super(
          title: I18n.t(:'errors.not_validated.title'),
          status: 422,
          detail: errors
      )
    end
  end
end