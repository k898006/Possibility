class TemporaryPost < ApplicationRecord
  belongs_to :post
  belongs_to :stadium
  has_many_attached :images
end
