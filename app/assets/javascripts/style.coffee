$ ->
  class Pugetive.Style
    constructor: ->
      @apply_dynamic_styles()

    apply_dynamic_styles: ->
      $('input[type=submit]').addClass('button')
      $('a.button, input[type=submit]').addClass('radius secondary')

  new Pugetive.Style()
