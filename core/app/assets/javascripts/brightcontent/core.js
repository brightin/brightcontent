//= require bootstrap-wysihtml5
//= require brightcontent/wysithtml5-parser-rules
//= require bootstrap-wysihtml5/locales/nl-NL

$(function() {
  var editorLocale = $('body').data('editorLocale');

  $('[data-wysihtml5]').wysihtml5({
    html: true,
    locale: editorLocale,
    parserRules: wysihtml5ParserRules,
    events: {
      load: function() {
        var editor = $("#insertable").data("wysihtml5").editor;
        editor.focus();
      }
    }
  });

  $('[data-behaviour~=datepicker]').datetimepicker({ pickTime: false, language: 'nl' })
  $('[data-behaviour~=datetimepicker]').datetimepicker({ language: 'nl' })
});
