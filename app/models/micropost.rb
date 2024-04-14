class Micropost < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  # validates :image, content_type: { in: %w[image/jpeg image/gif image/png],message: "must be a valid image format" },
  #                   size: { less_than: 5.megabytes,message: "should be less than 5MB" }
  validate :correct_image_mime_type
  validate :acceptable_image_size

  # Returns a resized image for display.
  def display_image
  image.variant(resize_to_limit: [500, 500])
  end
  private
  def correct_image_mime_type
    if image.attached? && !image.content_type.in?(%w(image/jpeg image/png image/gif))
      errors.add(:image, 'must be a valid image format')
    end
  end

  def acceptable_image_size
    if image.attached? && image.blob.byte_size > 5.megabytes
      errors.add(:image, 'should be less than 5MB')
    end
  end
end
