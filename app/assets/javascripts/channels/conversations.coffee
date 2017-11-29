jQuery(document).on 'turbolinks:load', ->
  messages_to_bottom = -> messages.scrollTop(messages.prop("scrollHeight"))
  messages = $('#conversation-body')

  if messages.length > 0
    messages_to_bottom()
