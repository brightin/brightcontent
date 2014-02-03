#= require jquery-fileupload/basic

$ ->
  request_url = $("#attachable_url").val()

  $('#fileupload').fileupload
    done: (e, data) ->
      $.get request_url, (attachments_view) ->
        $('#attachments').html attachments_view

  $("#attachments").sortable
    axis: "y"
    cancel: "input,textarea,button,select,option,a"
    distance: 5
    update: ->
      $.post "#{request_url}/reposition", positions: ($("#attachments > *").map -> $(this).data "attachment-id").toArray()

  $("#attachments").disableSelection()
