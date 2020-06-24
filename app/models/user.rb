class User < ApplicationRecord
  validates :introduction, length: { maximum: 50}
  validates :name, length: { minimum: 2, maximum: 20}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        #  :database_authenticatable（パスワードの正確性を検証）
        #  :registerable（ユーザ登録や編集、削除）
        #  :recoverable（パスワードをリセット）
        #  :rememberable（ログイン情報を保存）
        #  :validatable（emailのフォーマットなどのバリデーション）

        attachment :profile_image
        # ↑ データベースのidを抜いた版！
        has_many :books, dependent: :destroy
end
