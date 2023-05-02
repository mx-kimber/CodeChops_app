class UserChop < ApplicationRecord
  belongs_to :chop
  belongs_to :user
end
