class Job < ApplicationRecord

  validates :title, presence: true

  belongs_to :user
  belongs_to :mission

end
