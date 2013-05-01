$ ->

  $(".hover-circle").mouseenter ->
    $(this).parent().siblings('.infobox').fadeIn(400)

  $(".infobox").mouseleave ->
    $(this).fadeOut(400)
