class Post < ApplicationRecord
    has_many :comments
    validates :name, length: { maximum: 20 } ,presence: true
    validates :content, length: { maximum: 155 } ,presence: true
    validates :email, length: { maximum: 20 } ,presence: true
    attribute :likes_count, :integer, default: 0
    attribute :dislikes_count, :integer, default: 0
    attribute :comments_count, :integer, default: 0
end
