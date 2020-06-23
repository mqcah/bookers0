class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: {maximum: 20}, length: {minimum: 2}
  validates :email, presence: true, uniqueness: true
  validates :introduction, length: {maximum: 50}
  def email_required?
  	false
  end
  def email_changed?
  	false
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :image

  has_many :books, dependent: :destroy
end
