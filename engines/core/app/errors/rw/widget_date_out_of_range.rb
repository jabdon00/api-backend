module Rw
  class WidgetDateOutOfRange < Dk::StandardError
    def initialize
      super(
          title: I18n.t(:'errors.widget_date_out_of_range.title'),
          status: 422,
          detail: I18n.t(:'errors.widget_date_out_of_range.detail')
      )
    end
  end
end