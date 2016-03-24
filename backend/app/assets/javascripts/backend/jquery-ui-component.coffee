$(document).on 'page:change', ->
  Turbolinks.enableProgressBar();
  $('.datepicker').datepicker();
  $('.ui.selectmenu').selectmenu();
