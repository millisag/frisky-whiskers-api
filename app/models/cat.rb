class Cat < ApplicationRecord
  belongs_to :user

  validates :name, :age, :weight, :breed, :color, presence: true
end

class FoodEntry < ApplicationRecord
  belongs_to :cat

  validates :name, :calories, presence: true
end

class ActivityEntry < ApplicationRecord
  belongs_to :cat

  validates :activity_type, :duration, :calories_burned, presence: true
end