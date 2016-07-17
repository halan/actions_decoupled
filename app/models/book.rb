class Book < ApplicationRecord
  validates :author, :title, presence: true
end
