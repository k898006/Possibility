class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :comment, presence: true

  has_many_attached :images

end
