class Post < ApplicationRecord
 belongs_to :user

 has_many :likes, dependent: :destroy
 has_many :liked_users, through: :likes, source: :user
 
 mount_uploader :image, ImageUploader

 has_many :comments, dependent: :destroy

 #postsテーブルから中間テーブルに対する関連付け
 has_many :post_tag_relations, dependent: :destroy
 #postsテーブルから中間テーブルを介してTagsテーブルへの関連付け
 has_many :tags, through: :post_tag_relations, dependent: :destroy
end
