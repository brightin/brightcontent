//= require jquery-fileupload/basic
//= require spin

$(function() {
  var request_url = $("#attachable_url").val();
  var spinner = new Spinner().spin();

  $('#fileupload').fileupload({
    method: "PUT",
    send: function() {
      spinner.spin($("#attachments-controls")[0]);
      $("#attachments *").attr({
        disabled: true
      });
      $("#fileupload").attr({
        disabled: true
      });
      $("#attachments-controls").css({
        opacity: 0.5
      });
    },
    done: function(e, data) {
      $.get(request_url, function(attachments_view) {
        $('#attachments').html(attachments_view);
        spinner.stop();
        $("#fileupload").attr({
          disabled: false
        });
        $("#attachments-controls").css({
          opacity: 1
        });
      });
    }
  });

  $("#attachments").on("click", ".insert-image", function(e) {
    e.preventDefault();
    var editor = $("#insertable").data("wysihtml5").editor;
    editor.composer.commands.exec("insertImage", {
      src: $(this).attr("href")
    });
  });

  $("#attachments").on("click", ".insert-link", function(e) {
    e.preventDefault();
    var editor = $("#insertable").data("wysihtml5").editor;
    editor.composer.commands.exec("createLink", {
      href: $(this).attr("href"),
      target: "_blank",
      rel: "nofollow",
      text: $(this).data("name")
    });
  });

  $("#attachments").on("click", ".delete", function(e) {
    var el = $(this).parents(".attachment");
    spinner.spin(el[0]);
    el.css({
      opacity: 0.5
    });
    el.find("*").attr({
      disabled: true
    });
    $.ajax({
      method: "DELETE",
      url: $(this).attr("href"),
      success: function() {
        el.remove();
      }
    });
    return false;
  });

  $("#attachments").sortable({
    axis: "y",
    cancel: "input,textarea,button,select,option,a",
    distance: 5,
    update: function() {
      $.post(request_url + "/reposition", {
        positions: ($("#attachments > *").map(function() {
          $(this).data("attachment-id");
        })).toArray()
      });
    }
  });

  $("#attachments").disableSelection();
});
