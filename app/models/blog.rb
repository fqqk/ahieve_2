class Blog < ApplicationRecord
  belongs_to :user
  paginates_per 10
  validates :title, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  scope :index_all, -> {
    select(:id, :title, :content, :created_at) #フィールドごとにレコードを取得
    .order(created_at: :asc) #created_atカラムの昇順に並び替え
    .includes(:user) #ユーザを事前に取得してN+1防止
  }
end
