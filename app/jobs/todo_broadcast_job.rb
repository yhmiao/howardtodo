class TodoBroadcastJob < ApplicationJob
  queue_as :default

  def perform(**opts)
    if opts[:act] == 'delete'
      ActionCable.server.broadcast "todo_channel", act: opts[:act], id: opts[:id]
    else
      ActionCable.server.broadcast "todo_channel", act: opts[:act], id: opts[:todo].id, todo: render_todo(opts[:todo])
    end
  end

  private
    def render_todo(todo)
      TodosController.render partial: 'todos/index_row', locals: {todo: todo}
    end
end
