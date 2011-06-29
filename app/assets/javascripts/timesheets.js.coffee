$ ->
  $('.date').dateinput
    format: 'yyyy-mm-dd'
    firstDay: 1

  $('.add-link').hide()
  $('#calendar td').mouseover( -> $(this).find(".add-link").show() )
                   .mouseout( -> $(this).find(".add-link").hide() )

