$ ->
  class Pugetive.Visibility
    constructor: ->
      @reset_visibility()

    reset_visibility: ->
      @foundationize()
      @hide_admin_elements()
      @show_admin_elements()
      @bind_lazy_loaders()
      @handle_missing_images()

    foundationize: ->
      $(document).foundation()

    hide_admin_elements: ->
      $('[data-visible-to]').hide()

    show_admin_elements: ->
      $('html.admin [data-visible-to]').show()

    bind_lazy_loaders: ->
      $('a.foundation-remote').one 'click', ->
        $clicked_link = $(this)
        $.get $clicked_link.attr('href'), (data) ->
          $clicked_link.parent().find('.accordion-content').html(data)

    handle_missing_images: ->
      $("img.thumbnail").on "error", ->
        $(this).attr('src', '/errors/missing-image.png').attr('title', 'Error Loading Image');


  new Pugetive.Visibility()


