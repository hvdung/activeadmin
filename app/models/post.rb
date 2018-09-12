class Post < ApplicationRecord
    mount_uploader :thumbnail, ImageUploader
    extend FriendlyId
    friendly_id :title, use: :slugged

    has_many :post_categories, dependent: :destroy
    has_many :categories, through: :post_categories

    scope :search_post, -> (search_content) {where("title like ?","%#{search_content}%")}
end
