require "date"

class Todo < ActiveRecord::Base
  def due_today?
    due_date == Date.today
  end

  def self.mark_as_complete!(todo_id)
    todo = find(todo_id)
    todo[:completed] = true
    todo.save
    todo
  end
  def self.completed
    all.where(completed: true)
  end
  def self.due
    all.where(completed: false)
  end
  def self.show_list
    puts "My Todo-list\n\n"

    puts "Overdue\n"
    puts overdue_list.map { |todo| todo.to_displayable_string }
    puts "\n\n"

    puts "Due Today\n"
    puts due_today_list.map { |todo| todo.to_displayable_string }
    puts "\n\n"

    puts "Due Later\n"
    puts due_later_list.map { |todo| todo.to_displayable_string }
    puts "\n\n"
  end
  def self.overdue_list
    where("due_date < ? ", Date.today)
  end
  def self.due_today_list
    where("due_date = ?", Date.today)
  end
  def self.due_later_list
    where("due_date > ?", Date.today)
  end
  def self.add_task(task)
    new_todo = Todo.create!(todo_text: task[:todo_text], due_date: Date.today + task[:due_in_days], completed: false)
  end
end
