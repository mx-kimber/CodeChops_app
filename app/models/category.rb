class Category < ApplicationRecord
  has_many :chops
  validates :name, presence: true, uniqueness: true
end
