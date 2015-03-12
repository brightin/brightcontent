#= require bootstrap-wysihtml5
#= require brightcontent/wysithtml5-parser-rules
#= require bootstrap-wysihtml5/locales/nl-NL

$ ->
  editorLocale = $('body').data('editorLocale')

  $('[data-wysihtml5]').wysihtml5
    html: true
    locale: editorLocale
    parserRules: wysihtml5ParserRules
    events:
      load: ->
        editor = $("#insertable").data("wysihtml5").editor
        editor.focus()
