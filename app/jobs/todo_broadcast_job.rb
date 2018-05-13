class TodoBroadcastJob < ApplicationJob
  queue_as :default

  def perform(**opts)
    args = if opts[:act] == 'delete'
      {act: opts[:act], id: opts[:id]}
    else
      {act: opts[:act], id: opts[:todo].id, todo: render_todo(opts[:todo], opts[:act])}
    end

    ActionCable.server.broadcast("todo_channel", **args)
  end

  private
    def render_todo(todo, act)
      TodosController.render(partial: 'todos/index_li', locals: {todo: todo, act: act})
    end
end
