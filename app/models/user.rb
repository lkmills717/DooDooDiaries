class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :meals, dependent: :destroy
  has_many :movements, dependent: :destroy
  validates :meals, presence: false
  has_one_attached :photo
end
