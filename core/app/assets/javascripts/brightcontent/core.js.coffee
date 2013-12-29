$ ->
  $('[data-wysihtml5]').wysihtml5
    html: true
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
