class Category < ApplicationRecord
  has_many :chops
  belongs_to :category
  validates :name, presence: true, uniqueness: true
end
