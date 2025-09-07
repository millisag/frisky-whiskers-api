class Cat < ApplicationRecord
  belongs_to :user

  has_many :food_entries, dependent: :destroy
  has_many :activity_entries, dependent: :destroy

  validates :name, :age, :weight, :breed, :color, presence: true
end
