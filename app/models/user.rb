class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tweets
  has_many :comments
  has_many :favorites, dependent: :destroy
  has_many :likes, dependent: :destroy

  def already_favorited?(tweet)
    self.favorites.exists?(tweet_id: tweet.id)
  end

  def already_liked?(tweet)
    self.likes.exists?(tweet_id: tweet.id)
  end

  def self.guest
    find_or_create_by!(nickname: 'ゲスト', email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

end
