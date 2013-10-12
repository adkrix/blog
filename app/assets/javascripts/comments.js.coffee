$ ->
  $("a.js-comment-delete").on "ajax:success", (e, data, status, xhr) ->
    $(@).closest(".js-comment-view").remove()