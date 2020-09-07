class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :comments

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze # 半角英数混合

  validates :nickname, presence: true
  validates :password, presence: true, format: { with: /\d{6}/, with: PASSWORD_REGEX } # ６文字以上

end