class Tweet < ApplicationRecord
    belongs_to :user

    #mount_uploader :image, ImageUploader
    mount_uploader :image2, Image2Uploader

    has_many :feedbacks, dependent: :destroy
end
