class User < ApplicationRecord
  has_many :todos

  def to_pleasant_string
    "#{id}.#{first_name}-#{last_name},#{email}"
  end
end
