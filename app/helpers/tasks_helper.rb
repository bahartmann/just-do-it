module TasksHelper
  def check_icon_class task_done
    task_done ? 'far fa-check-circle' : 'far fa-circle'
  end
end
