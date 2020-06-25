class Item < ApplicationRecord
  validates :price, numericality: { greater_than: 0 }
  validates :name, presence: true

  has_many :positions
  has_many :carts, through: :positions
  has_many :comments, as: :commentable

  has_attached_file :image, :styles => { :medium => '300x300', :thumb => '100x100' }, :default_url => "/assets/owl-cap.jpg"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
