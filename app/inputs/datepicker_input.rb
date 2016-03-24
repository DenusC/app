class DatepickerInput < SimpleForm::Inputs::Base
  def input_html_classes
    super.push('datepicker')
  end
end
