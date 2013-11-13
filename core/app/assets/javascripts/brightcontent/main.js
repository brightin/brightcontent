$(document).ready(function(){
  $('[data-wysihtml5]').each(function(i, elem) {
    $(elem).wysihtml5({
      html: true,
      locale: "nl-NL",
      parserRules:  wysihtml5ParserRules,
      "events": {
        "load": function() {
          editor = $('#insertable').data("wysihtml5").editor;
          editor.focus();
        }
      }
    });
  });

  $("#attachments").on("click", ".insert_image", function(e){
    e.preventDefault();
    editor.composer.commands.exec("insertImage", { src: $(this).data("insertImage") });
  });

  $("#attachments").on("click", ".insert_link", function(e){
    e.preventDefault();
    editor.composer.commands.exec("createLink", { href: $(this).data("insertUrl"), target: "_blank", rel: "nofollow", text: $(this).data("insertName") });
  });

});
