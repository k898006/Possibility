class Post < ApplicationRecord

  validates :title, presence: true
  validates :caption, presence: true

  has_one_attached :image

  belongs_to :user
  belongs_to :stadium
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end

end
