jQuery(document).on 'turbolinks:load', ->
  $('.collapsible').collapsible()

  $('#close_notice').on 'click', ->
    $(this).parent("#notice").hide()
