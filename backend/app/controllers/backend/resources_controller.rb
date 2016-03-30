module Backend
class ResourcesController <  ApplicationController
  def self.inherited(sub_klass)
    _resource_underscored =  sub_klass.to_s.demodulize.underscore.gsub('_controller', '')
    _model_klass = _resource_underscored.singularize.camelize.constantize

    sub_klass.class_exec do
      private
      # define sub_klas's instance methods
      define_method((_resource_underscored + '_params').to_sym) do
        params.require(_model_klass.to_s.underscore.to_sym).permit resource_attrs
      end

      define_method(:resource_attrs) do
        model_klass.attribute_names.delete_if{|attr| %w(created_at updated_at id).include? attr}.map(&:to_sym)
      end

      alias_method :resource_params, (_resource_underscored + '_params').to_sym
    end

    # define class singleton methods
    sub_klass.instance_variable_set(:@model_klass, _model_klass)
    sub_klass.instance_exec do
      def model_klass
        @model_klass
      end
    end
  end

  def index
    @resources = model_klass.all.order('id desc')
  end

  def new
    @resource = model_klass.new
  end

  def create
    @resource = model_klass.new(resource_params)
    if @resource.save
      redirect_to @resource, notice: '创建成功'
    else
      render :new
    end
  end

  def show
    @resource = model_klass.find(params[:id])
  end

  private
  def model_klass
    self.class.model_klass
  end
end
end
