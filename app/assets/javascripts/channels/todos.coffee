jQuery(document).on 'turbolinks:load', ->
  
  todo_index_body = $('#todo_index > tbody')

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
          todo_index_body.prepend data['todo']
        when 'update'
          todo_index_body.find('#index_row_' + data['id']).remove()
          todo_index_body.prepend data['todo']
        when 'delete'
          todo_index_body.find('#index_row_' + data['id']).remove()