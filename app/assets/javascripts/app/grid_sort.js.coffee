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

  $("#reference-grid, #reference-showcase").imagesLoaded ->
    $(this).isotope
      itemSelector: '.reference-tile',
      layoutMode: 'fitRows'

  $("#filter-accordion .accordion-inner a").click ->
    if $(this).hasClass('disabled')
      false
    else
      $(this).toggleClass('selected')
      filter_string = ''
      $.each $('.filter-list a.selected'), (index, value) ->
        filter_string += '.' + $(value).attr('data-filter')
      $("#reference-grid").isotope filter: filter_string

      class_list = ''
      $.each $('.reference-tile:not(.isotope-hidden)'), (index, value) ->
        class_list += ' ' + $(value).attr('class')
      disableCheckboxes(class_list)

      updateReferencesHeader()
      false

  $("#reset-filter").click ->
    filter_string = ''
    $("#reference-grid").isotope filter: filter_string
    $('.filter-list a').removeClass('selected disabled')
    updateReferencesHeader()
    false

  updateReferencesHeader = () ->
    ref_count = $('.reference-tile:not(.isotope-hidden)').length
    if ref_count == 1
      $("#reference-count").text(ref_count + ' referenz')
    else
      $("#reference-count").text(ref_count + ' referenzen')

    if $('.reference-tile.isotope-hidden').length == 0
      $("#reset-filter").addClass('hidden')
    else
      $("#reset-filter").removeClass('hidden')

  disableCheckboxes = (class_list) ->
    $.each $('ul.filter-list a'), (index, value) ->
      if class_list.indexOf($(this).attr("data-filter")) < 0
        $(this).addClass('disabled')
      else
        $(this).removeClass('disabled')

