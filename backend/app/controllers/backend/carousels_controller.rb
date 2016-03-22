require_dependency "backend/application_controller"

module Backend
  class CarouselsController < ApplicationController
    def index
      @carousels = Carousel.all.order('id desc')
    end

    def new
      @carousel = Carousel.new
    end
  end
end
