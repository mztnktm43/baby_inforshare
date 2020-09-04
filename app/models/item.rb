class Item < ApplicationRecord
  # extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  # has_noe_attahed :image
  has_many :comments
  belongs_to_active_hash :category
  belongs_to_active_hash :age_year
  belongs_to_active_hash :age_month

  validates :image, :name, :detail, :category_id, precence: true
end
