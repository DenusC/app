class PagesController < ApplicationController
  def home
    @videos = Video.all.order('id desc')
  end

end
