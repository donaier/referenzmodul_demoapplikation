$ ->
  $(".hover-circle").mouseenter ->
    $(this).parent().siblings('.infobox').fadeIn('fast')

  $(".infobox").mouseleave ->
    $(this).fadeOut('fast')
