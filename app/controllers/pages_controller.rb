class PagesController < ApplicationController
  def home
    @carousels = Carousel.order('priority asc')
    @videos = Video.all.order('id desc')
  end

end
