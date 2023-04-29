class Post < ApplicationRecord
  belongs_to :group
  belongs_to :user

  with_options presence: true do
    validates :title
    validates :sentence
  end
end
