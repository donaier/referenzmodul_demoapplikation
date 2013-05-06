$(document).ready ->

  $("#reference-tabs a").click (e) ->
    e.preventDefault()
    $(this).tab "show"
