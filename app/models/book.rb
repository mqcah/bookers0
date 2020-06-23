class Book < ApplicationRecord
  validates :title, presence: true, length: {maximum: 20}
  validates :option, presence: true, length: {maximum: 200}

  belongs_to :user
end
