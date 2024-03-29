class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  validates :name, presence: true 
  validates :profile, length: { maximum: 200 }

  # いいね機能
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post

  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end

  # 7-7
  mount_uploader :image, ImageUploader
  
  # つぶやきの場（tweetsテーブルとのアソシエーション）
  has_many :tweets, dependent: :destroy

  has_many :feedbacks, dependent: :destroy

  has_many :sends, dependent: :destroy
end
