class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5 }
  validates :content, presence: true
  validates :category, presence: true
end
