ready = () ->
  # comment add by ajax form
  $(".js-comment-add").on "ajax:success", (e, data, status, xhr) ->
    $(data.html).prependTo(".js-comment-list")
    $(@).find("[data-reset=true]").val("")
  # comment delete
  $(".js-comment-list").on "ajax:success", ".js-comment-delete", (e, data, status, xhr) ->
    $(@).closest(".js-comment-view").remove()

$(document).ready(ready)
$(document).on('page:load', ready)

