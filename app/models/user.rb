class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :blogs, dependent: :destroy
  has_many :comments, dependent: :destroy
  paginates_per 2
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :confirmable
  has_one_attached :icon

  scope :index_all, -> {
    select(:id, :name, :email)
    .order(id: :asc)
  }
end
