class Mission < ApplicationRecord

  belongs_to :user
  has_many :jobs

  validates :title, presence: true

end
