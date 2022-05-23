class Post < ApplicationRecord

  validates :title, presence: true
  validates :caption, presence: true

  has_many_attached :images

  #def get_image
    #unless images.attached?
      #file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      #image.attach(io: File.open(file_path), file_name: 'default-image.jpg', content_type: 'image/jpeg')
    #end
    #images
  #end
  has_many :comments, dependent: :destroy
  belongs_to :user
  belongs_to :stadium
  has_many :likes, dependent: :destroy

  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end

end
