$ ->

  $("#reference-grid").imagesLoaded ->
    $("#reference-grid").isotope
      itemSelector : '.reference-tile',
      layoutMode : 'fitRows'
