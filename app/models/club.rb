class Club < ApplicationRecord
  enum division: { choose_one: 0, division_1: 1, division_2: 2, division_3: 3 }

  validates :name, presence: true, uniqueness: true

  has_many :stadiums
end
