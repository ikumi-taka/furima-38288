class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :last_name, format: { with: /\A[ぁ-んァ-ヶー-龥々ー]/ } # 全角漢字ひらがなカタカナ入力を設定
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶー-龥々ー]/ } # 全角漢字ひらがなカタカナ入力を設定
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ } # 全角カタカナ入力を設定
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }  # 全角カタカナ入力を設定
    validates :birthday

    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
    validates_format_of :password, with: VALID_PASSWORD_REGEX
  end
end
