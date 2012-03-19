class Product < ActiveRecord::Base
  has_many :line_items
  has_many :orders, through: :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
  has_attached_file :picture
  
  validates :title, :author, :description, :picture, presence:true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness:true
  validates_attachment_content_type :picture, :content_type => 'image/jpeg'
  validates_attachment_presence :picture

  attr_accessor :photo_file_name
  attr_accessor :photo_content_type
  attr_accessor :photo_file_size
  attr_accessor :photo_updated_at

  # validates :image_url, allow_blank: true, format: {
  #   with: %r{\.(gif|png|jpg)$}i,
  #   message: 'must be GIF, PNG or JPG image'

  # }

  private

    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else
        errors.add(:base, 'Line Items present')
        return false
      end
    end
end
