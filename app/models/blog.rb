class Blog < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  paginates_per 10
  validates :title, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  scope :index_all, -> {
    select(:id, :title, :content, :updated_at, :user_id) #フィールドごとにレコードを取得
    .order(updated_at: :asc) #created_atカラムの昇順に並び替え
    .includes(:user) #ユーザを事前に取得してN+1防止
  }
end
