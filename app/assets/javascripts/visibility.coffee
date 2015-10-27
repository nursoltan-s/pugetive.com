$ ->
  class Pugetive.Visibility
    constructor: ->
      @hide_admin_elements()
      @show_admin_elements()

    hide_admin_elements: ->
      $('[data-visible-to]').hide()

    show_admin_elements: ->
      $('html.admin [data-visible-to]').show()

  new Pugetive.Visibility()
