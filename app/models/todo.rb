require "date"

class Todo < ActiveRecord::Base
  def due_today?
    due_date == Date.today
  end

  def self.completed
    all.where(completed: true)
  end

  def self.overdue_list
    where("due_date < ? and (not completed)", Date.today)
  end

  def self.due_today_list
    where("due_date = ?", Date.today)
  end

  def self.due_later_list
    where("due_date > ?", Date.today)
  end
end
