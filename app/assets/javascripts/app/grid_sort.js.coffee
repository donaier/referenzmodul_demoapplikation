$ ->

  $("#asset-grid").imagesLoaded ->
    $("#asset-grid").isotope
      itemSelector: '.asset-tile',
      layoutMode: 'fitRows',
      filter: ':not(.additional)'

  $("#more-images").click ->
    $("#asset-grid").isotope
      filter: '*'
    $(this).addClass('hidden')


  $("#reference-grid").imagesLoaded ->
    $("#reference-grid").isotope
      itemSelector: '.reference-tile',
      layoutMode: 'fitRows'

  $("#filter-accordion .accordion-inner a").click ->
    $(this).toggleClass('selected')
    filter_string = ''
    $.each $('.filter-list a.selected'), (index, value) ->
      filter_string += '.' + $(value).attr('data-filter')
    $("#reference-grid").isotope filter: filter_string
    updateReferencesHeader()
    false

  $("#reset-filter").click ->
    filter_string = ''
    $("#reference-grid").isotope filter: filter_string
    $('.filter-list a').removeClass('selected')
    updateReferencesHeader()
    false

  updateReferencesHeader = ()->
    ref_count = $('.reference-tile:not(.isotope-hidden)').length
    if ref_count == 1
      $("#reference-count").text(ref_count + ' referenz')
    else
      $("#reference-count").text(ref_count + ' referenzen')

    if $('.reference-tile.isotope-hidden').length == 0
      $("#reset-filter").addClass('hidden')
    else
      console.log 'damn'
      $("#reset-filter").removeClass('hidden')
