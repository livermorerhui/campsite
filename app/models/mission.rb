class Mission < ApplicationRecord

  belongs_to :user
  has_many :jobs
  has_many :resumes
    
  validates :title, presence: true

  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end

end
