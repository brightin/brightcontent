#= require jquery
#= require jquery_ujs
#= require twitter/bootstrap
#= require bootstrap-wysihtml5/b3
#= require bootstrap-wysihtml5/locales/nl-NL
#= require brightcontent/wysithtml5-parser-rules
#= require brightcontent/attachments
#= require brightcontent/pages
#= require brightcontent/custom
#= require_self

$ ->
  $('[data-wysihtml5]').wysihtml5
    html: true
    locale: "nl-NL"
    parserRules: wysihtml5ParserRules
    events:
      load: ->
        editor = $("#insertable").data("wysihtml5").editor
        editor.focus()

  $("#attachments").on "click", ".insert_image", (e) ->
    e.preventDefault()
    editor.composer.commands.exec "insertImage",
      src: $(this).data("insertImage")

  $("#attachments").on "click", ".insert_link", (e) ->
    e.preventDefault()
    editor.composer.commands.exec "createLink",
      href: $(this).data("insertUrl")
      target: "_blank"
      rel: "nofollow"
      text: $(this).data("insertName")
