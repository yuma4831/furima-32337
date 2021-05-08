class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_one :record

  with_options presence: true do
    validates :nickname
    with_options format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: '全角ひらがな、全角カタカナ、漢字で入力して下さい' } do
      validates :lastname
      validates :firstname
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナで入力して下さい' } do
      validates :lastname_kana
      validates :firstname_kana
    end
    validates :birthday
  end
end
