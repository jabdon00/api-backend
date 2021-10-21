module Rw
  class FoodNotFound < Dk::StandardError
    def initialize
      super(
          title: I18n.t(:'errors.food_not_found.title'),
          status: 404,
          detail: I18n.t(:'errors.food_not_found.detail')
      )
    end
  end
end