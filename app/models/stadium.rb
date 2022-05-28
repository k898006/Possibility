class Stadium < ApplicationRecord
    belongs_to :club
    has_many :posts, dependent: :destroy

    validates :name, presence: true, uniqueness: true

end
