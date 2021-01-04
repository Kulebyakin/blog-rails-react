class Post < ApplicationRecord
  belongs_to :topic
  belongs_to :user
  has_rich_text :body

  validates :title, presence: true, length: { maximum: 300 }
  validates :body, presence: true
end
