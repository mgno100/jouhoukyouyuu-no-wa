class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
  has_many :posts, -> { order(created_at: :desc) }

  validates :name, presence: true
end
