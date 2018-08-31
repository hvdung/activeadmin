class Post < ApplicationRecord
    mount_uploader :thumbnail, ImageUploader

    has_many :post_categories, dependent: :destroy
    has_many :categories, through: :post_categories
end
