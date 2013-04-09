$(document).ready(function(){
  $('[data-editor]').each(function(i, elem) {
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

  $(".insert_image").live("click", function(e){
    e.preventDefault();
    console.log($(this).data("insertImage"));
    editor.composer.commands.exec("insertImage", { src: $(this).data("insertImage") });
  });

  $(".insert_link").live("click", function(e){
    e.preventDefault();
    console.log($(this).data());
    editor.composer.commands.exec("createLink", { href: $(this).data("insertUrl"), target: "_blank", rel: "nofollow", text: $(this).data("insertName") });
  });

});
