class TodoList
  attr_reader :title, :items

  def initialize(title)
    @title = title
    @items = Array.new
  end

  def add_item(description, due_date, project, context)
    item = Item.new(description, due_date, project, context)
    @items.push(item)
  end

end

class Item
  attr_reader :description, :isComplete, :due_date, :project, :context
  
  def initialize(description, due_date, project, context)
    @description = description
    @due_date = due_date
    @project = project
    @context = context
    @isComplete = false
  end

end
