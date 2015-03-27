class Question < ActiveRecord::Base
  validates :title, presence: true, length: {minimum: 40}
  validates :detail, presence: true, length: {minimum: 150}

  has_many :answers, dependent: :destroy

end
