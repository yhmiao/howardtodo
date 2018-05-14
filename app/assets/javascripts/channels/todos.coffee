jQuery(document).on 'turbolinks:load', ->
  todo_index = $('#todo_index')

  App.global_chat = App.cable.subscriptions.create {
      channel: "TodoChannel"
    },
    connected: ->
      # Called when the subscription is ready for use on the server

    disconnected: ->
      # Called when the subscription has been terminated by the server

    received: (data) ->
      switch data['act']
        when 'create'
          todo_index.prepend data['todo']
        when 'update'
          todo_index.find('#index_li_' + data['id']).remove()
          todo_index.prepend data['todo']
        when 'delete'
          todo_index.find('#index_li_' + data['id']).remove()
