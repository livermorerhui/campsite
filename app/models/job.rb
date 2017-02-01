class Job < ApplicationRecord

  belongs_to :user
  belongs_to :mission

  validates :title, presence: true

end
