require_relative 'todolist.rb'
require 'date'

# Creates a new todo list
todo_list = TodoList.new("Udacitask Manager")

# Print header message
puts "Welcome to #{todo_list.title}\n\n"

# Add four new items
todo_list.add_item("Buy a smartphone", Date.new(2016,6,27), "Find a Wife", "Errands")
todo_list.add_item("Download Tinder", Date.new(2016,6,28), "Find a Wife", "Phone")
todo_list.add_item("Buy workout gear", Date.new(2016,6,29), "Get Fit", "Errands")
todo_list.add_item("Think of excuse to avoid workout", Date.new(2016,6,26), "Get Fit", "On Couch")

# Print the list
todo_list.print_list

# New Feature: List by project
todo_list.print_list_by_project("Get Fit")

# New Feature: List by context
todo_list.print_list_by_context("Errands")

# Delete the first item
todo_list.delete_item_at(0)

# Print the list
todo_list.print_list

# Delete the second item
todo_list.delete_item_at(0)

# Print the list
todo_list.print_list

# Update the completion status of the first item to complete
todo_list.mark_complete_on_item(2)

# Print the list
todo_list.print_list

# Update the title of the list
todo_list.title = "Udacitask 2.0"

# Print the list
todo_list.print_list

