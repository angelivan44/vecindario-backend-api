class Comment < ApplicationRecord
  belongs_to :post , counter_cache: :comments_count
  validates :name, length: { maximum: 50 } ,presence: true
  validates :content, length: { maximum: 155 } ,presence: true
  validates :email, length: { maximum: 50 } ,presence: true
end
