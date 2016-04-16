class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :diff_browser

  private
  def diff_browser
    session['mobile'] = params['mobile'] if params['mobile']
    mobile = session['mobile']
    request.variant = ('1' ==  mobile ? :mobile : nil)
  end
end
