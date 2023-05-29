# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(task)
    raise TypeError, 'can only add Todo objects' unless task.instance_of?(Todo)
    @todos << task
  end
  alias_method :<<, :add

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def to_a
    @todos.clone
  end

  def done?
    @todos.all? { |task| task.done == true }
  end

  def item_at(index)
    @todos.fetch(index)
  end

  def mark_done_at(index)
    item_at(index).done!
  end

  def mark_undone_at(index)
    item_at(index).undone!
  end

  def done!
    @todos.each { |task| task.done! }
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(index)
    @todos.delete(item_at(index))
  end

  def to_s
    text = "---- #{title} ----\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end

  def each
    @todos.each do |task|
      yield(task)
    end
    self
  end

  def select
    results = TodoList.new(title)
    @todos.each do |task|
      results << task if yield(task)
    end
    results
  end

  # takes a string as argument, and returns the first Todo object that matches the argument. Return nil if no todo is found.
  def find_by_title(string)
    select { |task| task.title == string}.first
  end

  # returns new TodoList object containing only the done items
  def all_done
    select { |task| task.done? }
  end

  # returns new TodoList object containing only the not done items
  def all_not_done
    select { |task| !task.done? }
  end

  # takes a string as argument, and marks the first Todo object that matches the argument as done.
  def mark_done(string)
    find_by_title(string) && find_by_title(string).done!
  end

  # mark every todo as done
  def mark_all_done
    each { |task| task.done! }
  end

  # mark every todo as not done    
  def mark_all_undone
    each { |task| task.undone! }
  end
end


todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

# todo1.done!

# results = list.select { |todo| todo.done? }    # you need to implement this method

# puts results.inspect

# p list.find_by_title("Clean room")
list.mark_done('Buy milk')
p list.all_done
# puts list.all_not_done
list.mark_all_done
p list.all_done
list.mark_all_undone
p list.all_done