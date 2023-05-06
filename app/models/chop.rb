class Chop < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :user_chops
  has_many :users, through: :user_chops
  validates :problem, presence: true
  validates :solution, presence: true
  validates :user_id, presence: true
end

