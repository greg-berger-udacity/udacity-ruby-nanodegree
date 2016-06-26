require 'date'

class TodoList
  attr_reader :items
  attr_accessor :title

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

  def toggle_complete_on_item(id)
    item_to_change = @items.find { |item| item.id == id }
    item_to_change.toggle_complete if !item_to_change.nil?
  end

  def print_list
    puts "******** #{@title} Tasks ********"
    @items.each do |item|
      item.print
    end
  end

  def print_list_by_project(project)
    unless is_project_complete? project
      puts "******** #{@title} Tasks by Project: #{project} ********"
      @items.each do |item|
        if item.project == project
          item.print
        end
      end
    else
      puts "******** #{@title}: No tasks remain for Project #{project} ********\n\n"
    end
  end
  
  def print_list_by_context(context)
    puts "******** #{@title} Tasks by Context: #{context} ********"
    @items.each do |item|
      if item.context == context
        item.print
      end
    end
  end

  def is_project_complete?(project)
    active_item = @items.find { |item| item.project == project }
    return !active_item.nil?
  end

end

class Item
  attr_reader :id, :description, :due_date, :project, :context
  attr_accessor :isComplete
  
  def initialize(id, description, due_date, project, context)
    @id = id
    @description = description
    @due_date = due_date
    @project = project
    @context = context
    @isComplete = false
  end

  def print
      puts "Task ID: #{@id}\nDescription: #{@description}\nProject: #{@project}\nContext: #{@context}\nDue: #{@due_date}\nComplete? #{@isComplete}\n\n"
  end

  def toggle_complete
    @isComplete = !@isComplete
  end

end
