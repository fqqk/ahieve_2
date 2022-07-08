class Contact < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :category, presence: true
  validates :content, presence: true
end
