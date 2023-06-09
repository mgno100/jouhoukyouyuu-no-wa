class Post < ApplicationRecord
  belongs_to :group
  belongs_to :user
  has_many :comments, dependent: :destroy

  with_options presence: true do
    validates :title
    validates :sentence
  end
end
