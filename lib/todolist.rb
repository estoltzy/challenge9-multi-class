class TodoList
  def initialize
    @tasks = []
  end

  def add(todo)
    @tasks << todo
  end

  def complete
    @tasks.select do |task|
      task.done?
    end
  end

  def incomplete
    @tasks.select do |task|
      !task.done?
    end
  end

  def delete(completed_todo)
    @tasks.delete(completed_todo)
    return @tasks
  end

  def list_todos
    return @tasks
  end
end