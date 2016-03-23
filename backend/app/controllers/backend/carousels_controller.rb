module Backend
class CarouselsController < ResourcesController
  def show
    redirect_to action: :index
  end
end
end
