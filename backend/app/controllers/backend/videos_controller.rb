module Backend
class VideosController < ResourcesController
  def show
    redirect_to action: :index
  end
end
end
