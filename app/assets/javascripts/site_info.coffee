


$(() ->

  $(document).on 'turbolinks:load', () ->

    $(".ui.menu>.item").on "click", ".remove", (e) ->
      e.preventDefault()
      url = $(this).attr("href")
      title = $(this).data("title")
      $target = $(e.delegateTarget)

      if confirm("是否确认移除[#{title}]!")
        $.ajax
          url: url
          type: "DELETE"
          dataType: "json"
          success: () =>
            $target.remove()
    .on "mouseenter", (e) ->
      $(".remove", e.delegateTarget).show()
    .on "mouseleave", (e) ->
      $(".remove", e.delegateTarget).hide()
)