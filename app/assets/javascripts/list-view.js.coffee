$ ->
  $(".select input").change ->
    if $("input[type=checkbox]:checked").length == 0
      $('#delete-button').attr("disabled", "disabled")
    else
      $('#delete-button').removeAttr("disabled")
