class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  has_many :comments
  belongs_to_active_hash :category
  belongs_to_active_hash :age_year
  belongs_to_active_hash :age_month

  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 50 }
    validates :detail, length: {maximum: 1000 }
    validates :category_id, numericality: { other_than: 1 }
  end
end
