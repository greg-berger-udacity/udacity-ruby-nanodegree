require 'date'

class TodoList
  attr_reader :title, :items
  attr_writer :title

  def initialize(title)
    @title = title
    @items = Array.new
  end

  def add_item(description, due_date, project, context)
    item = Item.new(items.size, description, due_date, project, context)
    @items.push(item)
  end

  def delete_item_at(index)
    @items.delete_at(index)
  end

  def mark_complete_on_item(id)
    @items.each do |item|
      if item.id == id
        item.isComplete = true
      end
    end
  end

  def print_list
    puts "******** #{@title} Tasks ********"
    @items.each do |item|
      puts "Task ID: #{item.id}\nDescription: #{item.description}\nProject: #{item.project}\nContext: #{item.context}\nDue: #{item.due_date}\nComplete? #{item.isComplete}\n\n"
    end
  end

  def print_list_by_project(project)
    puts "******** #{@title} Tasks by Project: #{project} ********"
    @items.each do |item|
      if item.project == project
        puts "Task ID: #{item.id}\nDescription: #{item.description}\nProject: #{item.project}\nContext: #{item.context}\nDue: #{item.due_date}\nComplete? #{item.isComplete}\n\n"
      end
    end
  end
  
  def print_list_by_context(context)
    puts "******** #{@title} Tasks by Context: #{context} ********"
    @items.each do |item|
      if item.context == context
        puts "Task ID: #{item.id}\nDescription: #{item.description}\nProject: #{item.project}\nContext: #{item.context}\nDue: #{item.due_date}\nComplete? #{item.isComplete}\n\n"
      end
    end
  end

end

class Item
  attr_reader :id, :description, :isComplete, :due_date, :project, :context
  attr_writer :isComplete
  
  def initialize(id, description, due_date, project, context)
    @id = id
    @description = description
    @due_date = due_date
    @project = project
    @context = context
    @isComplete = false
  end

end
