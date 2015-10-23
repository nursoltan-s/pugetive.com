$ ->
  class Pugetive.Style
    constructor: ->
      alert('doing')
      @apply_dynamic_styles()

    apply_dynamic_styles: ->
      $('a.button').addClass('tiny radius')

  new Pugetive.Style()
