class Mission < ApplicationRecord
  validates :title, presence: true
  belongs_to :user
  has_many :jobs
end
