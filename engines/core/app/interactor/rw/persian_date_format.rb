module Rw
  class PersianDateFormat
    include Interactor

    def call
      context.result = context.value.to_s != '' ? context.value.to_parsi.strftime('%F') : nil
    end
  end
end