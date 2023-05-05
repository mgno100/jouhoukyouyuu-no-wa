class Group < ApplicationRecord
  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users
  has_many :posts, -> { order(created_at: :desc) }, dependent: :destroy
  belongs_to :user

  validates :name, presence: true
end
