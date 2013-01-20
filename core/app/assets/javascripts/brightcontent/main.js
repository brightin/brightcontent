$(document).ready(function(){
  $('textarea').each(function(i, elem) {
    $(elem).wysihtml5({
      html: true,
      locale: "nl-NL"
    });
  });
});
