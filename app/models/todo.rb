require "date"

class Todo < ApplicationRecord
  validates :todo_text, presence: true
  validates :todo_text, length: { minimum: 2 }
  validates :due_date, presence: true

  belongs_to :user

  def due_today?
    due_date == Date.today
  end

  def self.completed
    all.where(completed: true)
  end

  def self.overdue_list
    all.where("due_date < ? and (not completed)", Date.today)
  end

  def self.due_today_list
    all.where("due_date = ?", Date.today)
  end

  def self.due_later_list
    all.where("due_date > ?", Date.today)
  end
end
