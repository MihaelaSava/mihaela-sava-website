class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5 }
  validates :content, presence: true
  validates :category, presence: true, inclusion: { in: %w[prevernal vernal estival autumnal hiemal] }
end
